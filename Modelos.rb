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

ACCION Modelo_2 ES
	AMBIENTE
		
	PROCESO
		
FIN_ACCION