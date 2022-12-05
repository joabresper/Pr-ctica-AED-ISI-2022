ACCION Modelo1 ES
	AMBIENTE
		Fecha = Registro
			anio: N(4)
			mes: 1..12
			dia: 1..31
		FinRegistro

		Socio = Registro
			dni: N(8)
			ape_nom: AN(30)
			edad: 18..80
			ciudad: AN(30)
			deudor: ("si", "no")
			cant_prestamos: entero
		FinRegistro

		Libro = Registro
			id: 1..100
			titulo: AN(30)
			genero: N(2)
			disponible: booleano
		FinRegistro

		Prestamo = Registro
			id: N(8)
			dni_socio: N(8)
			id_libro: 1..100
			fecha_prestamo: Fecha
			fecha_devolucion: Fecha
			devolucion: ("si", "no")
		FinRegistro

		A_socios: Archivo de Socio indexado por dni
		A_libros: Archivo de Libro indexado por id
		A_prestamos: Archivo de Prestamo indexado por id
		R_socios: Socio
		R_libros: Libro
		R_prestamos: Prestamo

		continuar_programa: N(1)
		dni_entrada: N(8)
		titulo_entrada: AN(30)

		FUNCION Buscar_id_libro(titulo: AN(30)): 1..100 ES
			AMBIENTE
				cen: entero

			PROCESO
				Mientras (cen < 100) y (titulo <> ARR_LIBROS[cen]) hacer
					cen := cen + 1
				FinMientras

				Si ARR_LIBROS[cen] = titulo entonces
					Buscar_id_libro := cen
				Sino
					Buscar_id_libro := 999
				FinSi
		FIN_FUNCION

		PROCEDIMIENTO Dar_de_alta_socio() ES
			ESCRIBIR("Ingrese el apellido y nombre del nuevo socio")
			LEER(R_socios.ape_nom)
			ESCRIBIR("Ingrese la edad del nuevo socio)
			LEER(R_socios.edad)
			Mientras (R_socios.edad<18) y (R_socios.edad>80) hacer
				ESCRIBIR("Para poder ser socio la edad debe ser mayor a 18 y menor a 80 anios")
				ESCRIBIR("Ingrese un valor de edad correcta")
				LEER(R_socios.edad)
			FinMientras
			ESCRIBIR("Ingrese la ciudad de residencia del nuevo socio")
			LEER(R_socios.ciudad)
			R_socios.deudor := "no"
			R_socios.cant_prestamos := 0

			ESCRIBIR(A_socios, R_socios)
		FIN_PROCEDIMIENTO

	PROCESO
		ABRIR E/S (A_socios); ABRIR E/S (A_libros); ABRIR /S (A_prestamos)

		ESCRIBIR("Sistema de registro de prestamos de libros")
		ESCRIBIR("Si desea procesar un nuevo prestamo presione [1]. Para salir presione [0]")
		LEER(continuar_programa)

		Mientras continuar_programa = 1 hacer
			ESCRIBIR("Ingrese el DNI del socio")
			LEER(dni_entrada)
			ESCRIBIR("Ingrese el titulo del libro a prestar)
			LEER(titulo_entrada)

			R_libros.id := Buscar_id_libro(titulo_entrada)
			LEER(A_libros, R_libros)

			Si EXISTE entonces
				Si R_libros.disponible entonces
					R_libros.disponible := Falso
					RE-ESCRIBIR(A_libros, R_libros)
				Sino
					ESCRIBIR("El libro no esta disponible. Ya ha sido prestado.")
				FinSi
			Sino
				ESCRIBIR("El libro no exsite en la biblioteca.)
			FinSi

				
FIN_ACCION

================================================================================================================

ACCION Modelo2 ES
	AMBIENTE
		Vacunacion = Registro
			clave = Registro
				dni: N(8)
				sexo: ("F", "M")
				nro_dosis: N(1)
			FinRegistro
			fecha_aplicacion: Fecha
			nom_ape: AN(30)
			id_vacuna: entero
			baja: booleano
			id_provincia: entero
		FinRegistro

		Vacuna = Registro
			id: entero
			nombre: AN(20)
			cant_dosis: N(1)
		FinRegistro

		Persona = Registro
			clave = Registro
				dni: N(8)
				sexo: ("F", "M")
				nro_dosis: N(1)
			FinRegistro
			nom_vacuna: AN(20)
			fecha_ult_modif: Fecha
			fecha_aplicacion: Fecha
			id_provincia: entero
		FinRegistro

		Novedades: Archivo de Vacunacion ordenado por clave
		R_nov: Vacunacion
		Vacunas: Archivo de Vacuna indexado por id
		R_vac: Vacuna
		Personas: Archivo de Persona indexado por clave
		R_pers: Persona

		bajas, errores_vacunas, 1: entero
		
		Totales_dosis: Arreglo [1..10] de entero


	PROCESO
		ABRIR E/ (Novedades); ABRIR E/ (Vacunas); ABRIR E/S (Personas)
		LEER(Novedades, R_nov)
		Inicializar_totales_dosis()

		bajas := 0
		errores_vacunas := 0

		Mientras NFDA(Novedades) hacer

			R_pers.clave := R_nov.clave
			LEER(Personas, R_pers)

			i := R_nov.clave.nro_dosis

			Si EXISTE entonces
				//Baja de registro
				Si R_nov.baja entonces
					ELIMINAR(Personas, R_pers)
					bajas := bajas + 1
					Totales_dosis[i] := Totales_dosis[i] - 1
				Sino
				//Modificacion de registro
					R_vac.id := R_nov.id_vacuna
					LEER(Vacunas, R_vac)

					Si EXISTE entonces
						Si 
						R_pers.nom_vacuna := R_vac.nombre
						R_pers.fecha_ult_modif := Sistema.FechaHoy()
						R_pers.fecha_aplicacion := R_nov.fecha_aplicacion
						R_pers.id_provincia := R_nov.id_provincia

						RE-ESCRIBIR(Personas, R_pers)
					Sino
					//ID vacuna no encontrado
						ESCRIBIR("ID de vacuna no encontrado en Archivo de vacunas")
						errores_vacunas := errores_vacunas + 1
					FinSi
				FinSi
			Sino
			//Alta de registro
				R_vac.id := R_nov.id_vacuna
				LEER(Vacunas, R_vac)

				Si EXISTE entonces
					R_pers.nom_vacuna := R_vac.nombre
					R_pers.fecha_ult_modif := Sistema.FechaHoy()
					R_pers.fecha_aplicacion := R_nov.fecha_aplicacion
					R_pers.id_provincia := R_nov.id_provincia

					ESCRIBIR(Personas, R_pers)
					
				Sino
				//ID vacuna no encontrado
					ESCRIBIR("ID de vacuna no encontrado en Archivo de vacunas")
					errores_vacunas := errores_vacunas + 1
				FinSi
			FinSi




		
FIN_ACCION

================================================================================================================

ACCION Modelo3 ES
	AMBIENTE
		Reclamo = Registro
			region: N(2)
			cod_recl: N(10)
			fecha_recl: Fecha
			email_cli: AN(20)
			urgencia: ("A", "M", "B")
			detalle: AN(100)
		FinRegistro

		Reporte = Registro
			region: N(2)
			ult_fecha_recl: Fecha
			urg_A: N(6)
			urg_M: N(6)
			urg_B: N(6)
			nueva_aud: ("S", "N")
		FinRegistro

		Auditorias: Arreglo [1..20] de entero
		A_reclamos: Archivo de Reclamo ordenado por region, cod_recl
		Reg_recl: Reclamo
		A_reportes: Archivo de Reporte indexado por region
		Reg_repo: Reporte

		urgencia_erronea: booleano
		i, nuevas_aud: entero

		PROCEDIMIENTO Actualizar_segun_urgencia() ES
			Segun Reg_recl.urgencia hacer
				"A":	Reg_repo.urg_A := Reg_repo.urg_A + 1
				"M":	Reg_repo.urg_M := Reg_repo.urg_M + 1
				"B":	Reg_repo.urg_B := Reg_repo.urg_B + 1\
				Contrario
					ESCRIBIR("Valor de urgencia erroneo")
					urgencia_erronea := Verdadero
			FinSegun
		FIN_PROCEDIMIENTO


	PROCESO
		ABRIR E/ (A_reclamos); ABRIR E/S (A_reportes); LEER(A_reclamos, Reg_recl)

		Cargar_datos_auditorias()
		nuevas_aud := 0
		
		//Actualizacion de reportes
		Mientras NFDA(A_reclamos) 
			urgencia_erronea := Falso

			Reg_repo.region := Reg_recl.region
			LEER(A_reportes, Reg_repo)

			Si EXISTE entonces
				//Modificacion de los campos del registro en el archivo de reportes
				Actualizar_segun_urgencia()

				Si no urgencia_erronea entonces
					Reg_repo.ult_fecha_recl := Reg_recl.fecha_recl
				Sino
					ESCRIBIR("Reclamo descartado por error en el valor de urgencia")
				FinSi
			FinSi

			LEER(A_reclamos, Reg_recl)
		FinMientras
		
		//Comprobacion de necesidad de nuevas auditorias
		Para i := 1 hasta 20 hacer
			Reg_repo.region := i
			LEER(A_reportes, Reg_repo)

			Si (Auditorias[i] < 10) y (Reg_repo.urg_A > (Reg_repo.urg_B * 2) entonces
				Si Reg_repo.nueva_aud <> "S" entonces
					Reg_repo.nueva_aud := "S"
					Auditorias[i] := Auditorias[i] + 1
					nuevas_aud := nuevas_aud + 1
				FinSi
			FinSi
		FinPara

		ESCRIBIR("Nuevas auditorias solicitadas: ", nuevas_aud)

		CERRAR(A_reclamos); CERRAR(A_reportes)
FIN_ACCION

================================================================================================================

ACCION Modelo4 ES
	AMBIENTE
		Fecha = Registro
			anio: N(4)
			mes: 1..12
			dia: 1..31
		FinRegistro

		Reclamo = Registro
			region: N(2)
			cod_recl: N(10)
			fecha_recl: Fecha
			email_cli: AN(20)
			urgencia: ("A", "M", "B")
			detalle: AN(100)
		FinRegistro

		ArchR: Archivo de Reclamo
		RegR: Reclamo
		Informe: Arreglo [1..4, 1..13] de entero

		i, j, mes_max, meses_menos_10_M: entero
		

		PROCEDIMIENTO Inicializar_informe() ES
			Para i := 1 hasta 4 hacer
				Para j := 1 hasta 13 hacer
					Informe[i, j] := 0
				FinPara
			FinPara
		FIN_PROCEDIMIENTO

		FUNCION Mapear_urgencia(urg: caracter): entero ES
			Segun urg hacer
				"A":	Mapear_urgencia := 1
				"M":	Mapear_urgencia := 2
				"B":	Mapear_urgencia := 3
			FinSegun
		FIN_FUNCION

	PROCESO
		ABRIR E/ (ArchR); LEER(ArchR, RegR)
		Inicializar_informe()

		//Cargar datos en arreglo Informes
		Mientras NFDA(ArchR) hacer
			i := Mapear_urgencia(RegR.urgencia)
			j := RegR.fecha_recl.mes

			Informe[i, j] := Informe[i, j] + 1
			Informe[4, j] := Informe[4, j] + 1
			Informe[i, 13] := Informe[i, 13] + 1
			Informe[4, 13] := Informe[4, 13] + 1

			LEER(ArchR, RegR)
		FinMientras

		//----------Emitir resultados
		//Mes con mayor nro de reclamos
		mes_max := LV	
		Para j := 1 hasta 12 hacer
			Si Informe[4, j] > mes_max entonces
				mes_max := j
			FinSi
		FinPara
		ESCRIBIR("Mes con el mayor numero de reclamos: ", mes_max)

		//Cantidad de reclamos registrados por tipo de urgencia
		ESCRIBIR("Cantidad de reclamos de urgencia ALTA: ", Informe[1, 13])
		ESCRIBIR("Cantidad de reclamos de urgencia MEDIA: ", Informe[2, 13])
		ESCRIBIR("Cantidad de reclamos de urgencia BAJA: ", Informe[3, 13])

		//Reclamos de urgencia alta en enero
		ESCRIBIR("Reclamos de urgencia ALTA en el mes de ENERO: ", Informe[1, 1])

		//Meses con menos de 10 reclamos de urgencia media
		meses_menos_10_M := 0
		Para j := 1 hasta 12 hacer
			Si Informe[2, j] < 10 entonces
				meses_menos_10_M := meses_menos_10_M + 1
			FinSi
		FinPara
		ESCRIBIR("Meses donde se registraron menos de 10 reclamos de urgencia MEDIA: ", meses_menos_10_M)

		CERRAR(ArchR)
FIN_ACCION

================================================================================================================

ACCION Modelo5 ES
	AMBIENTE
		Flota = Registro
			cod_flota: entero
			vigente: ("si", "no")
			cod_estado: 1..4
			km_recorridos: real
		FinRegistro

		Flota_mov = Registro
			cod_flota: entero
			km_recorridos: real
			cod_estado: 1..4
		FinRegistro

		A_mov: Archivo de Flota_mov ordenado por cod_flota
		Reg_mov: Flota_mov
		A_mae, A_sal: Archivo de Flota ordenado por cod_flota
		Reg_mae, Reg_sal: Flota
		
		estado1, estado2, estado3, estado4, erroneos, total: entero

		PROCEDIMIENTO Leer_mov() ES
			LEER(A_mov, Reg_mov)
			Si FDA(A_mov) entonces
				Reg_mov.cod_flota := HV
			FinSi
		FIN_PROCEDIMIENTO

		PROCEDIMIENTO Leer_mae() ES
			LEER(A_mae, Reg_mae)
			Si FDA(A_mae) entonces
				Reg_mae.cod_flota := HV
			FinSi
		FIN_PROCEDIMIENTO

		PROCEDIMIENTO Proceso_iguales() ES
			Reg_sal := Reg_mae
			Segun Reg_mov.cod_estado hacer
				1:	ESCRIBIR("ERROR - Codigo de flota ya existente. No es podible dar el alta")
					erroneos := erroneos + 1

				2:	Si Reg_mov.km_recorridos>=0 entonces
						Reg_sal.vigente := "si"
						Reg_sal.cod_estado := 2
						Reg_sal.km_recorridos := Reg_sal.km_recorridos + Reg_mov.km_recorridos
						estado2 := estado2 + 1
					Sino
						ESCRIBIR("ERROR - Valor de km recorridos incoherente)
						erroneos := erroneos + 1
					FinSi

				3:	Reg_sal.cod_estado := 3
					estado3 := estado3 + 1
				
				4:	Reg_sal.vigente := "no"
					Reg_sal.cod_estado := 4
					estado4 := estado4 + 1
			FinPara
		FIN_PROCEDIMIENTO

		PROCEDIMIENTO Proceso_distintos() ES
			Si Reg_mov.cod_estado = 1 entonces
				Reg_sal.cod_flota := Reg_mov.cod_flota
				Reg_sal.vigente := "si"
				Reg_sal.cod_estado := 1
				Reg_sal.km_recorridos := Reg_mov.km_recorridos
				estado1 := estado1 + 1
				ESCRIBIR(A_sal, Reg_sal)
			Sino
				ESCRIBIR("ERROR - Codigo de estado incoherente. Codigo de flota no encontrado")
				erroneos := erroneos + 1
			FinSi
		FIN_PROCEDIMIENTO

	PROCESO
		ABRIR E/ (A_mov); ABRIR E/ (A_mae); ABRIR /S (A_sal)
		
		Leer_mae(); Leer_mov()

		Mientras (Reg_mae <> HV) o (Reg_mov <> HV) hacer
			Si Reg_mae.cod_flota = Reg_mov.cod_flota entonces
				Proceso_iguales()
				ESCRIBIR(A_sal, Reg_sal)
				Leer_mae()
				Leer_mov()
			Sino
				Si Reg_mae.cod_flota < Reg_mov.cod_flota entonces
					Reg_sal := Reg_mae
					ESCRIBIR(A_sal, Reg_sal)
					Leer_mae
				Sino
					Proceso_distintos()
					Leer_mov()
				FinSi
			FinSi
		FinMientras

		total := estado1 + estado2 + estado3 + estado4

		//Emision de informes
		ESCRIBIR("Total aviones en estado 1: ", estado1, " - ", estado1/total, "%")
		ESCRIBIR("Total aviones en estado 2: ", estado2, " - ", estado2/total, "%")
		ESCRIBIR("Total aviones en estado 3: ", estado3, " - ", estado3/total, "%")
		ESCRIBIR("Total aviones en estado 4: ", estado4, " - ", estado4/total, "%")
		
		ESCRIBIR("Movimientos erroneos que no se pudieron procesar: ", erroneos)

		CERRAR(A_mae); CERRAR(A_mov); CERRAR(A_sal)
FIN_ACCION

