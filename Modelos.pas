ACCION Modelo_1 ES
	AMBIENTE
		Fecha = Registro
			anio: N(4)
			mes: 1..12
			dia: 1..31
		FinRegistro

		Usuario = Registro
			sucursal: N(4)
			area: N(4)
			id: N(8)
			nombre_completo: AN(150)
			fecha_ultimo_login: Fecha
		FinRegistro

		U_Eliminados = Registro
			sucursal: N(4)
			area: N(4)
			cantidad: N(3)
		FinRegistro

		resg_sucursal: N(4)
		resg_area: N(4)

		eliminados_area: N(4)
		eliminados_sucursal: entero
		eliminados_total: entero
		dias_inact_area: entero
		dias_inact_sucursal: entero
		dias_inact_total: entero

		arch: Archivo de Usuario ordenado por sucursal, area, id
		user: Usuario
		arch_sal: Archivo de U_Eliminados
		elim: U_Eliminados

		fecha_actual: Fecha

		PROCEDIMIENTO corte_area() ES
			PROCESO
				ESCRIBIR("El total de usuarios eliminados en el area ", resg_area, " es de: ", eliminados_area)
				ESCRIBIR("El promedio de dias de inactividad de los mismos es de: ", dias_inact_area/eliminados_area)

				# Generar archivo de salida
				elim.sucursal := resg_sucursal
				elim.area := resg_area
				elim.cantidad := eliminados_area
				ESCRIBIR(arch_sal, elim)

				eliminados_sucursal := eliminados_sucursal + eliminados_area
				eliminados_area := 0
				dias_inact_sucursal := dias_inact_sucursal + dias_inact_area
				dias_inact_area := 0
				resg_area := user.area
		FIN_PROCEDIMIENTO

		PROCEDIMIENTO corte_sucursal() ES
			PROCESO
				corte_area()
				ESCRIBIR("El total de usuarios a eliminar en la sucursal ", resg_sucursal, " es de: ", eliminados_sucursal)
				ESCRIBIR("El promedio de dias de inactividad de los mismos es de: ", dias_inact_sucursal/eliminados_sucursal)
				eliminados_total := eliminados_total + eliminados_sucursal
				eliminados_sucursal := 0
				dias_inact_total := dias_inact_total + dias_inact_sucursal
				dias_inact_sucursal := 0
				resg_sucursal := user.sucursal
		FIN_PROCEDIMIENTO

	PROCESO
		ABRIR E/ (arch); ABRIR /S (arch_sal)
		LEER(arch, user)

		eliminados_area, eliminados_sucursal, eliminados_total := 0
		dias_inact_area, dias_inact_sucursal, dias_inact_total := 0

		resg_area := user.area
		resg_sucursal := user.sucursal

		ESCRIBIR("Ingrese la fecha actual con el siguiente formato: AAAA MM DD")
		LEER(fecha_actual.anio, fecha_actual.mes, fecha_actual.dia)

		Mientras NFDA(arch) hacer
			# Tratar corte
			Si resg_sucursal<>user.sucursal entonces
				corte_sucursal()
			Sino
				Si resg_area<>user.area entonces
					corte_area()
				FinSi
			FinSi

			# Tratar registro
			Si diff_fecha(fecha_actual, user.fecha_ultimo_login)>50 entonces
				eliminados_area := eliminados_area + 1
				dias_inact_area := dias_inact_area + diff_fecha(fecha_actual, user.fecha_ultimo_login)
			FinSi

			# Leer registro
			LEER(arch, user)
		FinMientras

		corte_sucursal()

		# Emision de totales generales
		ESCRIBIR("El total general de usuarios a eliminar es de: ", eliminados_total)
		ESCRIBIR("El promedio de dias de inactividad de los mismos es de: ", dias_inact_total/eliminados_total)
		
		CERRAR(arch); CERRAR(arch_sal)	
FIN_ACCION

=================================================================================================================================

ACCION Modelo_2 ES
	AMBIENTE
		sec: Secuencia de caracter
		v: caracter

		cant_letras: N(3)
		cant_por_lab: entero
		cant_total: entero
		id_caracter: AN(1)
		linea: ("A", "G", "R")

		FUNCION Nro_1al9_a_caracter(nro: N(2)): AN(1) ES
			AMBIENTE
				id: N(1)
			PROCESO
				Si nro<10 entonces
					id := nro
				Sino
					id := (nro DIV 10) + (nro MOD 10)
				FinSi

				Segun id hacer
					1:	Nro_en_caracter := "1"
					2:	Nro_en_caracter := "2"
					3:	Nro_en_caracter := "3"
					4:	Nro_en_caracter := "4"
					5:	Nro_en_caracter := "5"
					6:	Nro_en_caracter := "6"
					7:	Nro_en_caracter := "7"
					8:	Nro_en_caracter := "8"
					9:	Nro_en_caracter := "9"
				FinSegun
		FIN_FUNCION

	PROCESO
		ARRANCAR(sec); AVANZAR(sec, v)

		ESCRIBIR("Indique la letra correspondiente a la linea terapeutica de los productos que desea consultar: ")
		ESCRIBIR("(A) Antiinflamatorio")
		ESCRIBIR("(G) Gastroenterologica")
		ESCRIBIR("(R) Respitatoria/Antialergica")
		LEER(linea)

		Mientras NFDS(sec) hacer
			# Escribir y Avanzar nombre laboratorio
			ESCRIBIR("Laboratorio: ")
			Mientras NFDS(sec) y v<>"-" hacer
				ESCRIBIR(v)
				AVANZAR(sec, v)
			FinMientras
			# Resetear contador de productos por laboratorio
			cant_por_lab := 0
			# Avanzar guion
			AVANZAR(sec, v)
			# Tratar productos
			Mientras NFDS(sec) y v<>"@" hacer
				# Escribir productos de la linea. Caso contrario, avanzarlos
				Si v=linea entonces
					# Contar producto
					cant_por_lab := cant_por_lab + 1
					# Avanzar caracter indicador de la linea elegida
					AVANZAR(sec, v)
					# Resetear contador de letras
					cant_letras := 0
					# Escribir nombre del producto y actualizar contador
					Mientras v<>"@" y v<>" " hacer
						cant_letras := cant_letras + 1
						ESCRIBIR(sec, v)
						AVANZAR(sec, v)
					FinMientras
					# Escribir caracter verificador
					id_caracter := Nro_1al9_a_caracter(cant_letras)
					ESCRIBIR(sec, id_caracter)
					# Escribir espacio en blanco
					ESCRIBIR(sec, " ")
				Sino
					Mientras v<>"@" y v<>" " hacer
						AVANZAR(sec, v)
					FinMientras
				FinSi

				# Avanzar blancos finales
				Mientras v<>"@" y v=" " hacer
					AVANZAR(sec, v)
				FinMientras
			FinMientras

			# Informar cantidad de productos de la linea por laboratorio
			ESCRIBIR("Cantidad de productos de la linea '", linea, "': ", cant_por_lab)
			# Acumular total
			cant_total := cant_total + cant_por_lab

			# Avanzar simbolo arroba
			AVANZAR(sec, v)
		FinMientras
		# Informar cantidad total de productos de la linea
		ESCRIBIR("Total General de productos de la linea '", linea, "': ", cant_total)

		CERRAR(sec)
FIN_ACCION

=================================================================================================================================

ACCION Modelo_3 ES
	AMBIENTE
		sec: Secuencia de caracter
		v: caracter
		sal: Secuencia de caracter

		numeros = ("1", "2", "3", "4", "5", "6")
		correcion: caracter
		error: logico
		orac_con_error: entero
		orac_sin_error: entero
		pal_con_error: entero
		pal_total: entero

		FUNCION Corregir_caracteres(car: AN(1)): AN(1) ES
			Segun car hacer
				"1":	Corregir_caracteres := "q"
				"2":	Corregir_caracteres := "w"
				"3":	Corregir_caracteres := "e"
				"4":	Corregir_caracteres := "r"
				"5":	Corregir_caracteres := "t"
				"6":	Corregir_caracteres := "y"
			FinSegun
		FIN_FUNCION

	PROCESO
		ARRANCAR(sec); AVANZAR(sec, v)
		CREAR(sal)

		pal_con_error, orac_con_error, orac_sin_error, pal_total := 0
		
		Mientras NFDS(sec) hacer
			error := Falso
			# Tratar oraciones
			Mientras NFDS(sec) y v<>"." hacer
				# Tratar palabra impar
				Mientras v<>"." y v<>" " hacer
					Si (v en numeros) entonces
						correcion := Corregir_caracteres(v)
						ESCRIBIR(sal, correcion)
						error := Verdadero
						pal_con_error := pal_con_error + 1
					Sino
						ESCRIBIR(sal, v)
					FinSi
					AVANZAR(sec, v)
				FinMientras
				# Contar palabra impar
				pal_total := pal_total + 1
				# Avanzar espacio en blanco si no es final de oracion
				Si v=" " entonces
					ESCRIBIR(sal, v)
					AVANZAR(sec, v)
				FinSi
				# Avanzar palabra par
				Mientras v<>"." y v<>" " hacer
					ESCRIBIR(sal, v)
					AVANZAR(sec, v)
				FinMientras
				# Avanzar espacio en blanco si no es final de oracion
				Si v=" " entonces
					ESCRIBIR(sal, v)
					AVANZAR(sec, v)
				FinSi
				# Contar palabra par
				pal_total := pal_total + 1
			FinMientras
			# Avanzar punto
			ESCRIBIR(sal, v)
			AVANZAR(sec, v)
			# Evaluar si la oracion tuvo correcciones
			Si error entonces
				orac_con_error := orac_con_error + 1
			Sino
				orac_sin_error := orac_sin_error + 1
		FinMientras

		ESCRIBIR("Oraciones con alguna palabra modificada: ", orac_con_error)
		ESCRIBIR("Oraciones sin palabras modificadas: ", orac_sin_error)
		ESCRIBIR("Total de palabras modificadas en todo el texto: ", pal_con_error)
		ESCRIBIR("Porcentaje de palabras modificadas sobre el total del texto: ", (pal_con_error/pal_total)*100, "%")

		CERRAR(sec); CERRAR(sal)c
FIN_ACCION

