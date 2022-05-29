ACCION Ejer_18_05_22 ES
	AMBIENTE
		Fecha = Registro
			anio: N(4); 
			mes: 1...12;
			dia: 1...31;
		FinRegistro

		Usuario = Registro
			sucursal: N(4);
			area: N(4);
			perfil: ("RO", "RW", "ADM", "SEG"); # RO: solo lectura; RW: lectura y escritura; ADM: administrador; SEG: seguridad
			identificador: N(8);
			nombre_completo: AN(150);
			fecha_ult_login: Fecha;
		FinRegistro

		Administrador = Registro
			sucursal: N(4);
			area: N(4);
			identificador: N(8);
			nombre_completo: AN(150);
		FinRegistro

		arch_usuarios: Archivo de Usuario ordenado por sucursal, area, perfil, identificador
		r: Usuario
		arch_sal: Archivo de Administrador
		r_sal: Administrador

		RO_elim: entero
		RW_elim: entero
		ADM_elim: entero
		SEG_elim: entero

		total_RO: entero
		total_inact_RO: entero
		tiempo_inact: entero

	PROCESO
		ABRIR E/(arch_usuarios)
		LEER(arch_usuarios, r)
		ABRIR /S(arch_sal)


		RO_elim := 0
		RW_elim := 0
		ADM_elim := 0
		SEG_elim := 0
		total_inact_elim_RO := 0
		
		Mientras NFDA(arch_usuarios) hacer
			tiempo_inact := diff_fecha(fecha_actual(), r.fecha_ult_login)

			Segun r.perfil hacer
				"RO":	Si tiempo_inact > 90 entonces
							RO_elim := RO_elim + 1
							total_inact_RO := total_inact_RO + tiempo_inact
						Contrario
							total_inact_RO := total_inact_RO + tiempo_inact
						FinSi
						total_RO := total_RO + 1

				"RW":	Si tiempo_inact > 50 entonces
							RW_elim := RW_elim + 1
						FinSi

				"ADM":	Si tiempo_inact > 10 entonces
							ADM_elim := ADM_elim + 1

							r_sal.sucursal := r.sucursal
							r_sal.area := r.area
							r_sal.identificador := r.identificador
							r_sal.nombre_completo := r.nombre_completo

							ESCRIBIR(arch_sal, r_sal)
						FinSi
				
				"SEG":	Si tiempo_inact > 40 entonces
							SEG_elim := SEG_elim + 1
						FinSi
			FinSegun

			LEER(arch_usuarios, r)
		FinMientras

		ESCRIBIR("Usuarios a eliminar del perfil RO: ", RO_elim)
		ESCRIBIR("Usuarios a eliminar del perfil RW: ", RW_elim)
		ESCRIBIR("Usuarios a eliminar del perfil ADM: ", ADM_elim)
		ESCRIBIR("Usuarios a eliminar del perfil SEG: ", SEG_elim)

		ESCRIBIR("El promedio de dias de inactividad del perfil RO es de: ", (total_inact_RO/total_RO))

		CERRAR(arch_usuarios); CERRAR(arch_sal)
FIN_ACCION