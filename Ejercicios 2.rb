ACCION Ejer_2_1_1 ES
	AMBIENTE
		sec: secuencia de caracter
		v: entero
		cont: entero
	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)
		cont := 0
		Mientras v <> "*" hacer
			Si v = "A" entonces
				cont := cont + 1
			FinSi
			AVANZAR(sec, v)
		FinMientras
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_2 ES
	AMBIENTE
		sec: secuencia de caracter
		v: entero
		cont: entero
		vocales = ("A", "E", "I", "O", "U")
	PROCESO
		ARRANCAR(sec)
		cont := 0
		Repetir
			AVANZAR(sec, v)
			Si v no en vocales entonces
				cont := cont + 1
			FinSi
		Hasta que v = "Z"
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_3 ES
	AMBIENTE
		sec: secuencia de caracter
		v: entero
		salida: secuencia de caracter
	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)
		CREAR(salida)
		Mientras v <> "$" hacer
			ESCRIBIR(salida, v)
			AVANZAR(sec, v)
		FinMientras
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_4 ES
	AMBIENTE
		sec: secuencia de entero
		v: entero
		cont: entero
	
	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)

		Mientras no FDS(sec) hacer
			cont := cont + 1
			AVANZAR(sec, v)
		FinMientras

		ESCRIBIR("El numero de socios registrados es de ", cont)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_5 ES
	AMBIENTE
		sec: secuencia de entero
		sailda: secuencia de entero
		v: entero
		vc: entero
		anterior: entero

	PROCESO
		ARRANCAR(sec)
		CREAR(salida)

		AVANZAR(sec, v)
		anterior := v
		AVANZAR(sec, v)

		Mientras no FDS(sec) hacer
			Si v > (anterior + 1) entonces
				Para vc := 1 hasta (v - (anterior + 1)) hacer
					ESCRIBIR(salida, (anterior + vc))
				FinPara
			FinSi
			AVANZAR(sec, v)
		FinMientras

		CERRAR(sec)
		CERRAR(salida)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_7 ES
	AMBIENTE
		sec: secuencia de entero
		salida: secuencia de entero
		v: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)

		Mientras v <> 0 hacer
			Si (v MOD 10)=0 o (v MOD 10)=1 o (v MOD 10)=2 o (v MOD 10)=3 entonces
				ESCRIBIR(salida, v)
			FinSi
		FinMientras

		CERRAR(sec)
		CERRAR(salida)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_8 ES
	AMBIENTE
		sec: secuencia de entero
		salida: secuencia de caracter
		v: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)

		Mientras v <> 0 hacer
			Si (v MOD 10)=0 o (v MOD 10)=1 o (v MOD 10)=2 o (v MOD 10)=3 entonces
				ESCRIBIR(salida, v)
				ESCRIBIR(salida, "-")
			FinSi
		FinMientras

		CERRAR(sec)
		CERRAR(salida)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_9
	AMBIENTE
		sec: secuencia de caracter
		v: caracter
		cant: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)
		cont := 0

		Mientras NFDS(sec) hacer

			#Tratado de blancos
			Mientras NFDS(sec) y v=" " hacer
				AVANZAR(sec, v)
			FinMientras

			Si v="I" entonces
				cont := cont + 1
			FinSi

			#Avanzo las palabras
			Mientras NFDS(sec) y v<>" " hacer
				AVANZAR(sec, v)
			FinMientras
		FinMientras

		ESCRIBIR("La cantidad de palabras que empiezan con 'I' son: ", cont)
FIN_ACCION	

================================================================================================================

ACCION Ejer_2_1_10 ES
	AMBIENTE
		sec: secuencia de caracter
		v: caracter
		cant: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)
		cont := 0
		letra: caracter

		ESCRIBIR("Ingrese una letra para contar la cantidad de palabras que comienzan con la misma")
		LEER(letra)

		Mientras NFDS(sec) hacer

			#Tratado de blancos
			Mientras NFDS(sec) y v=" " hacer
				AVANZAR(sec, v)
			FinMientras

			#Evaluacion de condicion
			Si v=letra entonces
				cont := cont + 1
			FinSi

			#Avanzo las palabras
			Mientras NFDS(sec) y v<>" " hacer
				AVANZAR(sec, v)
			FinMientras
		FinMientras

		ESCRIBIR("La cantidad de palabras que empiezan con la letra ", letra, " son: ", cont)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_11 ES
	AMBIENTE
		sec: secuencia de caracter
		v: caracter
		cant_letras: entero
		palabras_4_letras: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)
		palabras_4_letras := 0

		Mientras NFDS(sec) hacer
			cant_letras := 0

			Mientras NFDS(sec) y v=" " hacer
				AVANZAR(sec, v)
			FinMientras

			Mientras NFDS(sec) y v<>" " hacer
				cant_letras := cant_letras + 1
				AVANZAR(sec, v)
			FinMientras

			Si cant_letras=4 entonces
				palabras_4_letras := palabras_4_letras + 1
			FinSi
		FinMientras

		ESCRIBIR("La cantidad de palabras de 4 letras es de ", palabras_4_letras)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_12 ES
	AMBIENTE
		sec: secuencia de caracter
		v: caracter
		cont: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)
		cont := 0

		Mientras NFDS(sec) hacer
			#Tratado de blancos y puntos
			Mietras NFDS(sec) y (v=" " o v=".") hacer
				AVANZAR(sec, v)
			FinMientras

			#Tratado de palabras
			Mientras NFDS(sec) y v<>" " y v<>"." hacer
				Si v="A" entonces
					AVANZAR(sec,v)
					Si NFDS(sec) y v<>" " y v<>"." y v="L" entonces
						AVANZAR(sec, v)
						Si NFDS(sec) y v<>" " y v<>"." y v="G" entonces
							cont := cont + 1
						FinSi
					FinSi
				FinSi
			FinMientras
		FinMientras

		ESCRIBIR("La cantidad de palabras presentes en la secuencia que comienzan con 'ALG' es de: ", cont)
		CERRAR(sec)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_12 ES
	AMBIENTE
		sec: secuencia de caracter
		v: caracter
		cont: entero
		total: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)
		cont := 0
		total := 0

		Mientras NFDS(sec) hacer
			#Tratado de blancos y puntos
			Mietras NFDS(sec) y (v=" " o v=".") hacer
				AVANZAR(sec, v)
			FinMientras

			#Tratado de palabras
			Mientras NFDS(sec) y v<>" " y v<>"." hacer
				Si v="A" entonces
					AVANZAR(sec,v)
					Si NFDS(sec) y v<>" " y v<>"." y v="L" entonces
						AVANZAR(sec, v)
						Si NFDS(sec) y v<>" " y v<>"." y v="G" entonces
							cont := cont + 1
						FinSi
					FinSi
				FinSi
				total := total + 1
			FinMientras
			AVANZAR(sec, v)
		FinMientras

		ESCRIBIR("El porcentaje que representan las palabras que comienzan con 'ALG' sobre el total de las palabras de la secuencia es de ", (cont/total)*100, "%")
		CERRAR(sec)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_14 ES @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	AMBIENTE
		sec: secuencia de caracter
		v: caracter
		cont_comas: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)
		cont_comas := 0
		
		Mientras NFDS(sec) hacer
			#Tratado de blancos
			Mientras NFDS(sec) y v=" " hacer
				AVANZAR(sec, v)
			FinMientras
			#Tratado de palabras
			Mientras NFDS(sec) y v<>" " hacer
				Si v="," entonces
					Repetir
						AVANZAR(sec, v)
						cont_comas := cont_comas + 1
					Hasta que v="," o FDS(sec)
				FinSi
				AVANZAR(sec, v)
			FinMientras

		FinMientras

FIN_ACCION

================================================================================================================
ACCION Ejer_2_1_15 ES
	AMBIENTE
		sec: secuencia de caracter
		v: entero
		total_palabras: entero
		oraciones: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)

		total_palabras := 0
		oraciones := 0

		Mientras NFDS(sec) hacer
			
			# Tratado de oraciones
			oraciones := oraciones + 1
			Mientras NFDS(sec) y v<>"." hacer
				
				# Tratado de blancos
				Mientras v<>"." y v=" " hacer
					AVANZAR(sec, v)
				FinMientras

				# Tratado de palabras
				total_palabras := total_palabras + 1
				Mientras v<>"." y v<>" " hacer
					AVANZAR(sec, v)
				FinMientras

			FinMientras
			AVANZAR(sec, v)
		FinMientras

		ESCRIBIR("El promedio de palabras por oracion es de ", (total_palabras DIV oraciones))
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_16 ES
	AMBIENTE
		sec: secuencia de entero #Secuencia de entrada
		salida: secuencia de entero #Secuencia de salida
		v: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)
		CREAR(salida)

		Mientras NFDS(sec) hacer
			Si (v MOD 3) = 0 entonces
				ESCRIBIR(salida, v)
			FinSi
			AVANZAR(sec)
		FinMientras
		CERRAR(salida)
		CERRAR(sec)
		# MAL - ESCRIBIR(salida)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_17 ES
	AMBIENTE
		sec: secuencia de caracter
		v: entero
		palabras: entero
		letras: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)

		palabras := 0
		letras := 0

		Mientras NFDS(sec) hacer
			
			Mientras NFDS(sec) y v<>"." hacer
				# Tratado de blancos
				Mientras v<>"." y v=" " hacer
					AVANZAR(sec, v)
				FinMientras

				# Tratado de palabras
				palabras := palabras + 1
				Mientras v<>"." y v<>" " hacer
					letras := letras + 1
					AVANZAR(sec, v)
				FinMientras
			FinMientras

			AVANZAR(sec, v)
		FinMientras

		Si (letras DIV palabras) > 5 entonces
			ESCRIBIR("El costo del telegrama es de ", (palabras*2))
		Contrario
			ESCRIBIR("El costo del telegrama es de ", palabras)
		FinSi
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_18 ES
	AMBIENTE
		sec: secuencia de caracter
		v: caracter
		sal: secuencia de caracter

	PROCESO
		ARRANCAR(sec)
		CREAR(sal)	
		AVANZAR(sec, v)

		Mietras NFDS(sec) hacer
			# Avanzar palabras impares
			Mientras v<>" " y NFDS(sec) hacer
				AVANZAR(sec, v)
			FinMientras

			# Avanzar espacio
			AVANZAR(sec, v)

			# Tratar palabras pares
			Si v="M" y NFDS(sec) entonces
				# Escribir palabras pares
				Mientras v<>" " y NFDS(sec) hacer
					ESCRIBIR(sal, v)
				FinMientras
				# Escribir espacio
				ESCRIBIR(sal, v)
			Contrario
				Mientras v<>" " y NFDS(sec) hacer
					AVANZAR(sec, v)
				FinMientras
			FinSi
			# Avanzar espacio
			AVANZAR(sec, v)
		FinMientras

		CERRAR(sec); CERRAR(sal)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_19 ES
	AMBIENTE
		sec: secuencia de caracter
		v: caracter
		sal: secuencia de caracter
		l1: caracter
		l2: caracter
		l3: caracter
		vc: entero
		cont_pal_3: entero
		cont_total: entero

	PROCESO
		ARRANCAR(sec)
		CREAR(sal)
		AVANZAR(sec, v)

		cont_pal_3 := 0
		cont_total := 0

		Mientras NFDS(sec) hacer
			# Tratar blancos
			Mientras NFDS(sec) y v<>" " hacer
				AVANZAR(sec, v)
			FinMientras
			# Tratar palabras
			l1 := v
			AVANZAR(sec, v)
			Si v<>" " y NFDS(sec) entonces
				l2 := v
				AVANZAR(sec, v)

				Si v<>" " y NFDS(sec) entonces
					l3 := v
					AVANZAR(sec, v)
				FinSi

				Si v=" " y NFDS(sec) entonces
					cont_pal_3 := cont_pal_3 + 1
					ESCRIBIR(sal, l1)
					ESCRIBIR(sal, l2)
					ESCRIBIR(sal, l3)
					ESCRIBIR(sal, v)
				FinSi
			FinSi

			cont_total := cont_total + 1
		FinMientras

		ESCRIBIR("El porcentaje de palabras de 3 caracteres sobre el total de la secuencia de entrada es de: ", (cont_pal_3/cont_total)*100)

		CERRAR(sec); CERRAR(sal)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_20 ES
	AMBIENTE
		sec1: secuencia de caracter
		sec2: secuencia de caracter
		sal: secuencia de caracter
		v1: caracter
		v2: caracter
		cont_orac_sec1: entero
		cont_orac_sec2: entero

	PROCESO
		ARRANCAR(sec1)
		ARRANCAR(sec2)
		CREAR(sal)

		cont_orac_sec1 := 0
		cont_orac_sec2 := 0
		
		Mientras NFDS(sec1) y NFDS(sec2) hacer
			# Avanzar blancos sec1
			Mientras v1=" " y NFDS(sec1) hacer
				AVANZAR(sec1, v1)
			FinMientras
			# Avanzar blancos sec2
			Mientras v2=" " y NFDS(sec2) hacer
				AVANZAR(sec2, v2)
			FinMientras
			# Escribir sujeto sec1
			Mientras v1<>"," y NFDS(sec1)
				ESCRIBIR(sal, v1)
				AVANZAR(sec1, v1)
			FinMientras
			# Escribir coma
			ESCRIBIR(sal, v1)
			# Avanzar sujeto sec2
			Mientras v2<>"," y NFDS(sec2) hacer
				AVANZAR(sec2, v2)
			FinMientras
			# Escribir predicado sec2
			Mientras v2<>"." y NFDS(sec2) hacer
				ESCRIBIR(sal, v2)
				AVANZAR(sec2, v2)
			FinMientras
			cont_orac_sec2 := cont_orac_sec2 + 1
			# Escribir punto
			ESCRIBIR(sal, v2)
			# Avanzar predicado sec1
			Mientras v1<>"." y NFDS(sec1) hacer
				AVANZAR(sec1, v1)
			FinMientras
			cont_orac_sec1 := cont_orac_sec1 + 1

			AVANZAR(sec1, v1)
			AVANZAR(sec2, v2)
		FinMientras

		ESCRIBIR("El total de oraciones de la secuencia 1 es de: ", cont_orac_sec1)
		ESCRIBIR("El total de oraciones de la secuencia 2 es de: ", cont_orac_sec2)

		CERRAR(sec1); CERRAR(sec2); CERRAR(sal)
FIN_ACCION

===============================================================================================================

ACCION Ejer_2_1_20 ES
	AMBIENTE
		sec1: secuencia de caracter
		sec2: secuencia de caracter
		sal: secuencia de caracter
		v1: caracter
		v2: caracter
		cont_orac_sec1: entero
		cont_orac_sec2: entero

	PROCESO
		ARRANCAR(sec1)
		ARRANCAR(sec2)
		CREAR(sal)

		cont_orac_sec1 := 0
		cont_orac_sec2 := 0
		
		Mientras NFDS(sec1) y NFDS(sec2) hacer
			# Avanzar blancos sec1
			Mientras v1=" " y NFDS(sec1) hacer
				AVANZAR(sec1, v1)
			FinMientras
			# Avanzar blancos sec2
			Mientras v2=" " y NFDS(sec2) hacer
				AVANZAR(sec2, v2)
			FinMientras
			# Escribir sujeto sec2
			Mientras v2<>"," y NFDS(sec2)
				ESCRIBIR(sal, v2)
				AVANZAR(sec2, v2)
			FinMientras
			# Escribir coma
			ESCRIBIR(sal, v2)
			# Avanzar sujeto sec1
			Mientras v1<>"," y NFDS(sec1) hacer
				AVANZAR(sec1, v1)
			FinMientras
			# Escribir predicado sec1
			Mientras v1<>"." y NFDS(sec1) hacer
				ESCRIBIR(sal, v1)
				AVANZAR(sec1, v1)
			FinMientras
			cont_orac_sec1 := cont_orac_sec1 + 1
			# Escribir punto
			ESCRIBIR(sal, v1)
			# Avanzar predicado sec2
			Mientras v2<>"." y NFDS(sec2) hacer
				AVANZAR(sec2, v2)
			FinMientras
			cont_orac_sec2 := cont_orac_sec2 + 1

			AVANZAR(sec1, v1)
			AVANZAR(sec2, v2)
		FinMientras

		ESCRIBIR("El total de oraciones de la secuencia 1 es de: ", cont_orac_sec1)
		ESCRIBIR("El total de oraciones de la secuencia 2 es de: ", cont_orac_sec2)

		CERRAR(sec1); CERRAR(sec2); CERRAR(sal)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_22 ES
	AMBIENTE
		sec_nom: secuencia de caracter
		sec_dni: secuencia de caracter
		sal: secuencia de caracter
		v_nom: caracter
		v_dni: caracter	
		vc: entero

		PROCEDIMIENTO Avanzar_blancos(sec: secuencia de caracter; v: caracter) ES
			PROCESO
				Mientras v=" " y NFDS(sec) hacer
					AVANZAR(sec, v)
				FinMientras
		FIN_PROCEDIMIENTO

	PROCESO
		ARRANCAR(sec_nom)
		ARRANCAR(sec_dni)
		CREAR(sal)
		
		AVANZAR(sec_nom, v_nom)
		AVANZAR(sec_dni, v_dni)

		Mientras NFDS(sec_nom) hacer
			# Tratar blancos
			Avanzar_blancos(sec_nom, v_nom)
			# Escribir DNI de persona en posicion impar
			Para vc := 1 hasta 8, hacer
				ESCRIBIR(sal, v_dni)
				AVANZAR(sec_dni, v_dni)
			FinPara
			# Escribir coma
			ESCRIBIR(sal, ",")
			# Escribir nombres de persona en posicion impar
			Mientras v_nom<>" " y NFDS(sec_nom) hacer
				ESCRIBIR(sal, v_nom)
				AVANZAR(sec_nom, v_nom)
			FinMientras
			# Escribir "#" al finalizar los datos de una persona en posicion impar
			ESCRIBIR(sal, "#")

			# Tratar blancos
			Avanzar_blancos(sec_nom, v_nom)
			# Avanzar nombre de persona en posicion par
			Mientras v_nom<>" " y NFDS(sec_nom) hacer
				AVANZAR(sec_nom, v_nom)
			FinMientras
			# Avanzar dni de persona en posicion par
			Para vc := 1 hasta 8, hacer
				AVANZAR(sec_dni, v_dni)
			FinPara
		FinMientras

		CERRAR(sec_nom); CERRAR(sec_dni); CERRAR(sal)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_23 ES
	AMBIENTE
		sec_nom: secuencia de caracter
		sec_dni: secuencia de caracter
		sal: secuencia de caracter
		v_nom: caracter
		v_dni: caracter	
		vc: entero

		impares = ("1", "3", "5", "7", "9")

		PROCEDIMIENTO Avanzar_blancos(sec: secuencia de caracter; v: caracter) ES
			PROCESO
				Mientras v=" " y NFDS(sec) hacer
					AVANZAR(sec, v)
				FinMientras
		FIN_PROCEDIMIENTO

	PROCESO
		ARRANCAR(sec_nom)
		ARRANCAR(sec_dni)
		CREAR(sal)
	
		AVANZAR(sec_nom, v_nom)
		AVANZAR(sec_dni, v_dni)

		Mientras NFDS(sec_nom) hacer
			# Avanzar blancos
			Avanzar_blancos(sec_nom, v_nom)
			# Comprobar si el dni comienza con nro impar
			Si v_dni en impares entonces
				# Escribir DNI
				Para vc := 1 hasta 8, hacer
					ESCRIBIR(sal, v_dni)
					AVANZAR(sec_dni, v_dni)
				FinPara
				# Escribir coma
				ESCRIBIR(sal, ",")
				# Escribir nombre
				Mientras v_nom<>" " y NFDS(sec_nom) hacer
					ESCRIBIR(sal, v_nom)
					AVANZAR(sec_nom, v_nom)
				FinMientras
				# Escribir #
				ESCRIBIR(sal, "#")

			Contrario
				# Avanzar nombre cuyo DNI no comienza con nro impar
				Mientras v_nom<>" " y NFDS(sec_nom) hacer
					AVANZAR(sec_nom, v_nom)
				FinMientras
				# Avanzar DNI
				Para vc := 1 hasta 8, hacer
					AVANZAR(sec_dni, v_dni)
				FinPara
			FinSi
		FinMientras

		CERRAR(sec_nom); CERRAR(sec_dni); CERRAR(sal)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_24 ES
	AMBIENTE
		sec_nom: secuencia de caracter
		sec_dni: secuencia de caracter
		sal: secuencia de caracter
		v_nom: caracter
		v_dni: caracter	
		vc: entero

		vocales = ("A", "E", "I", "O", "U")

		PROCEDIMIENTO Avanzar_blancos(sec: secuencia de caracter; v: caracter) ES
			PROCESO
				Mientras v=" " y NFDS(sec) hacer
					AVANZAR(sec, v)
				FinMientras
		FIN_PROCEDIMIENTO

	PROCESO
		ARRANCAR(sec_nom)
		ARRANCAR(sec_dni)
		CREAR(sal)

		AVANZAR(sec_nom, v_nom)
		AVANZAR(sec_dni, v_dni)

		Mientras NFDS(sec_nom) hacer
			# Avanzar blancos
			Avanzar_blancos(sec_nom, v_nom)
			# Comprobar si el dni comienza con nro impar
			Si v_nom en vocales entonces
				# Escribir DNI
				Para vc := 1 hasta 8, hacer
					ESCRIBIR(sal, v_dni)
					AVANZAR(sec_dni, v_dni)
				FinPara
				# Escribir coma
				ESCRIBIR(sal, ",")
				# Escribir nombre
				Mientras v_nom<>" " y NFDS(sec_nom) hacer
					ESCRIBIR(sal, v_nom)
					AVANZAR(sec_nom, v_nom)
				FinMientras
				# Escribir #
				ESCRIBIR(sal, "#")

			Contrario
				# Avanzar nombre cuyo DNI no comienza con nro impar
				Mientras v_nom<>" " y NFDS(sec_nom) hacer
					AVANZAR(sec_nom, v_nom)
				FinMientras
				# Avanzar DNI
				Para vc := 1 hasta 8, hacer
					AVANZAR(sec_dni, v_dni)
				FinPara
			FinSi
		FinMientras

		CERRAR(sec_nom); CERRAR(sec_dni); CERRAR(sal)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_25 ES
	AMBIENTE
		sec: secuencia de caracter
		sal1: secuencia de caracter
		sal2: secuencia de entero
		v: caracter
		cant_vocales: entero
		palabras: entero
		oraciones: entero

		vocales = ("A", "E", "I", "O", "U")

		PROCEDIMIENTO Avanzar_blancos(sec: secuencia de caracter; v: caracter) ES
			PROCESO
				Mientras v=" " y NFDS(sec) hacer
					AVANZAR(sec, v)
				FinMientras
		FIN_PROCEDIMIENTO

	PROCESO
		# Considero que la secuencia de entrada se encuentra organizada por oraciones separadas por "." y cada palabra separad por ","
		ARRANCAR(sec)
		CREAR(sal1)
		CREAR(sal2)

		AVANZAR(sec, v)
		oraciones := 0
		palabras := 0

		Mientras NFDS(sec) hacer
			# Tratar oraciones
			Mientras v<>"." y NFDS(sec) hacer
				# Avanzar blancos
				Avanzar_blancos(sec, v)
				# Tratar palabras
				Si v en vocales entonces
					cant_vocales := 0
					Mientras v<>"," y v<>"." hacer
						Si v en vocales entonces
							ESCRIBIR(sal1, "#")
							AVANZAR(sec, v)
							cant_vocales := cant_vocales + 1
						Contrario
							ESCRIBIR(sal1, v)
							AVANZAR(sec, v)
						FinSi
					FinMientras
					
					ESCRIBIR(sal2, cant_vocales)
					ESCRIBIR(sal2, 0)
					ESCRIBIR(sal1, ",")
				Contrario
					Mientras v<>"," y v<>"." hacer
						AVANZAR(sec, v)
					FinMientras
				FinSi

				AVANZAR(sec, v)
				palabras := palabras + 1
			FinMientras

			oraciones := oraciones + 1
			# Avanzar "."
			AVANZAR(sec, v)
		FinMientras

		ESCRIBIR("El promedio de palabras por oracion es de: ", (palabras DIV oraciones))

		CERRAR(sec); CERRAR(sal1); CERRAR(sal2)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_26 ES
	AMBIENTE
		
	PROCESO
		
FIN_ACCION

================================================================================================================

ACCION Ejer_2_1_30 ES
	AMBIENTE
		personas: Secuencia de caracter
		pers: caracter
		cuits: Secuencia de caracter
		c: caracter
		sec_sal: Secuencia de caracter

		cont_fisicas: entero
		cont_total: entero
		vc: entero
		vocal = ("A", "E", "I", "O", "U")
		
	PROCESO
		ARRANCAR(personas)
		AVANZAR(personas, pers)
		ARRANCAR(cuits)
		AVANZAR(cuits, c)
		CREAR(sec_salida)

		Mientras NFDS(personas) hacer
			#Tratamiento por provincias
			cont_fisicas := 0
			cont_total := 0

			Mientras pers<>"&" y NFDS(personas) hacer
				#Tratamiento nombres de personas fisicas que comienzan con vocal
				Si c = "2" entonces
					cont_fisicas := cont_fisicas + 1
					AVANZAR(cuits, c)
					AVANZAR(cuits, c)

					Si pers en vocal entonces
						#Escribir DNI de la persona en la secuencia de salida
						Para vc := 1 hasta 8 hacer
							ESCRIBIR(sec_sal, c)
							AVANZAR(cuits, c)
						FinPara
						#Avanzar hasta proximo cuit
						AVANZAR(cuits, c)

						#Escribir nombre completo en la secuencia de salida
						Mientras pers<>"-" hacer
							ESCRIBIR(sec_sal, pers)
							AVANZAR(personas, pers)
						FinMientras
						#Avanzar hasta proxima persona
						Para vc := 1 hasta 10 hacer
							AVANZAR(personas, pers)
						FinPara
					FinSi
					
				Contrario
					cont_total := cont_total + 1
					#Avanzar hasta proximo cuit
					Para vc := 1 hasta 11 hacer
						AVANZAR(cuits, c)
					FinPara
					#Avanzar hasta proxima persona
					Mientras pers<>"-" hacer
						AVANZAR(personas, pers)
					FinMientras
					Para vc := 1 hasta 9 hacer
						AVANZAR(personas, pers)
					FinPara
				FinSi

				ESCRIBIR("El total de personas fisicas en la provincia es de: ", cont_fisicas)
				ESCRIBIR("El porcentaje de personas fisicas sobre el total de la provincia es de: ", (cont_fisicas/cont_total)*100)
			FinMientras

			AVANZAR(personas, pers)
		FinMientras
FIN_ACCION

================================================================================================================

ACCION Ejer_2_2_1 ES
	AMBIENTE
		sec: secuencia de caracter
		salida: secuencia de caracter
		v: entero
		n_pares: entero
		n_impares: entero
		total_numericos: entero
		impares = ("1", "3", "5", "7", "9")
		pares = ("0", "2", "4", "6", "8")

	
	PROCESO
		ARRANCAR(sec)
		CREAR(salida)
		AVANZAR(sec, v)

		n_impares := 0
		n_pares := 0
		total_numericos := 0

		Mientras no FDS(sec) hacer
			Segun v hacer
				en impares : ESCRIBIR(salida, v)
							 n_impares := n_impares + 1
							 total_numericos := total_numericos + 1
				en pares : n_pares := n_pares + 1
							 total_numericos := total_numericos + 1
			FinSegun
			AVANZAR(sec, v)
		FinMientras

		CERRAR(sec)
		CERRAR(salida)

		ESCRIBIR("Se encontraron ", n_impares, " digitos impares.")
		ESCRIBIR("Se encontraron ", n_pares, " digitos pares.")
		ESCRIBIR("El total de caracteres numericos es de ", total_numericos, ".")
		ESCRIBIR("El porcentaje de caracteres impares es de ", (n_impares/total_numericos)*100, "% y el de pares, ", (n_pares/total_numericos)*100, "%.")
FIN_ACCION

================================================================================================================

ACCION Ejer_2_2_2 ES
	AMBIENTE
		sec: secuencia de caracter
		salida_num: secuencia de caracter
		salida_no_num: secuencia de caracter
		v: entero
		n_num: entero
		n_no_num: entero
		numericos = ("0", "1", "2", "3", "4", "5", "6", "7", "8", "9")

	PROCESO
		ARRANCAR(sec)	
		CREAR(salida_num)
		CREAR(salida_no_num)
		AVANZAR(sec, v)

		n_num := 0
		n_no_num := 0
			
		Mientras no FDS(sec) hacer
			Si v en numericos entonces
				ESCRIBIR(salida_num, v)
				n_num := n_num + 1

			Contrario
				ESCRIBIR(salida_no_num, v)
				n_no_num := n_no_num + 1
			FinSi
			AVANZAR(sec, v)
		FinMientras

		CERRAR(sec)
		CERRAR(salida_num)
		CERRAR(salida_no_num)

		ESCRIBIR("El total de caracteres numericos es de ", n_num, ". Y el total de caracteres no numericos de ", n_no_num, ".")
FIN_ACCION

================================================================================================================

ACCION Ejer_2_3_1 ES
	AMBIENTE
		Fecha = Registro
			anio: N(4)
			mes: 1...12
			dia: 1...31
		FinRegistro

		Alumno = Registro
			apellido_nombre: AN
			carrera = ("ISI", "IQ", "IEM")
			legajo: N(5)
			fecha_nacimiento: Fecha
			fecha_ingreso: Fecha
			dni: N(8)
			sexo = ("F", "M")
			fecha_ult_examen_aprob: Fecha
			nota: N(1.2)
		FinRegistro

		arch_alumnos: Archivo de Alumno
		r: Alumno

	PROCESO
		ABRIR E/ (arch_alumnos)
		LEER(arch_alumnos, r)
		
		Mientras NFDS(arch_alumnos) hacer
			ESCRIBIR("| ", r.legajo, " | ", r.apellido_nombre, " | ", r.dni, " | ", r.carrera, " |")
			LEER(arch_alumnos, r)
		FinMientras
FIN_ACCION

================================================================================================================

ACCION Ejer_2_3_2 ES
	AMBIENTE
		Fecha = Registro
			anio: N(4)
			mes: 1...12
			dia: 1...31
		FinRegistro

		Factura = Registro
			nro_factura: entero
			fecha: Fecha
			total: real
		FinRegistro

		arch: Archivo de Factura
		reg: Factura

		f: Fecha

	PROCESO
		ABRIR E/ (arch)
		LEER(arch, reg)

		ESCRIBIR("Ingrese una fecha con el siguiente formato: DD MM AAAA")
		LEER(f.dia, f.mes, f.anio)

		Mientras NFDS(arch) hacer
			Si (reg.fecha>f) y (reg.total<1000) entonces
				ESCRIBIR("| ", reg.nro_factura, " | ", reg.fecha, " | ", reg.total, " |")
			FinSi
			LEER(arch, reg)
		FinMientras
		CERRAR(arch)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_3_3 ES
	AMBIENTE
		Socio_biblio = Registro
			nro_socio: entero
			nro_telefono: N(10)
			apellido_nombre: AN(30)
			carrera = ("ISI", "IEM", "IQ", "LAR")
			domicilio = Registro
				calle: AN(20)
				nro: entero
			FinRegistro
			unid_prestadas: entero
		FinRegistro

		arch: Archivo de Socio_biblio
		sal: Archivo de Socio_biblio
		soc: Socio_biblio

	PROCESO
		ABRIR E/ (arch)
		ABRIR /S (sal)
		LEER(arch, soc)

		Mientras NFDS(arch) hacer
			Si (soc.carrera="ISI") y (soc.unid_prestadas>4) entonces
				ESCRIBIR(sal, soc)
			FinSi
			LEER(arch, soc)
		FinMientras
		
		CERRAR(arch); CERRAR(sal)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_3_4 ES
	AMBIENTE
		Fecha = Registro
			anio: N(4)
			mes: 1...12
			dia: 1...31
		FinRegistro

		Alumno = Registro
			apellido_nombre: AN
			carrera = ("ISI", "IQ", "IEM")
			legajo: N(5)
			fecha_nacimiento: Fecha
			fecha_ingreso: Fecha
			dni: N(8)
			sexo = ("F", "M")
			fecha_ult_examen_aprob: Fecha
			nota: N(1.2)
		FinRegistro

		arch: Archivo de Alumno
		sal: Archivo de Alumno
		al: Alumno

		carr: AN(3)
		anio_actual: N(4)

	PROCESO
		ABRIR E/ (arch)
		LEER(arch, al)
		
		ESCRIBIR("Ingrese una carrera: (ISI, IQ, IEM)")
		LEER(carr)
		ESCRIBIR("Ingrese el año actual: ")
		LEER(anio_actual)

		Mientras NFDA(arch) hacer
			Si (al.fecha_ult_examen_aprob.anio=anio_actual) y (al.nota>7) entonces
				ESCRIBIR(sal, al)
			FinSi
			LEER(arch, al)
		FinMientras

		CERRAR(arch); CERRAR(sal)
FIN_ACCION
================================================================================================================

ACCION Ejer_2_3_5 ES
	AMBIENTE
		Fecha = Registro
			anio: N(4)
			mes: 1...12
			dia: 1...31
		FinRegistro

		Alumno = Registro
			apellido_nombre: AN
			carrera = ("ISI", "IQ", "IEM")
			legajo: N(5)
			fecha_nacimiento: Fecha
			fecha_ingreso: Fecha
			dni: N(8)
			sexo = ("F", "M")
			fecha_ult_examen_aprob: Fecha
			nota: N(1.2)
		FinRegistro

		arch: Archivo de Alumno
		al: Alumno

		anio_actual: N(4)

	PROCESO
		ABRIR E/ (arch)
		LEER(arch, al)
		
		ESCRIBIR("Ingrese el año actual: ")
		LEER(anio_actual)

		Mientras NFDA(arch) hacer
			Si ((anio_actual-al.fecha_ingreso.anio)=1) y (al.nota>7) entonces
				ESCRIBIR("| ", al.legajo, " | ", al.apellido_nombre, " | ", al.carrera, " |")
			FinSi
			LEER(arch, al)
		FinMientras
		
		CERRAR(arch)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_3_6 ES
	AMBIENTE
		Graduado = Registro
			apellido_nombre: AN
			promedio: real
		FinRegistro

		arch_graduados: Archivo de Graduado
		r: Graduado
		recomendacion: ("NO", "SI", "F", "MF")
		total_prom: real
		total_grad: entero

	PROCESO
		ABRIR E/(arch_graduados)
		LEER(arch_graduados, r)

		total_prom := 0
		total_grad := 0

		Mientras NFDA(arch_graduados) hacer
			Segun r.promedio hacer
				<7: recomendacion := "NO"
					total_prom := total_prom + r.promedio
				<8: recomendacion := "SI"
					total_prom := total_prom + r.promedio
				<9: recomendacion := "F"
					total_prom := total_prom + r.promedio
				<=10: recomendacion := "MF"
					  total_prom := total_prom + r.promedio
			FinSegun

			total_grad := total_grad + 1
			ESCRIBIR("| ", r.apellido_nombre, " | ", r.promedio, " | ", recomendacion, " |")
			LEER(arch_graduados, r)
		FinMientras

		ESCRIBIR("La cantidad total de graduados recomendados es de: ", total_grad)
		ESCRIBIR("El promedio global de los graduados es de: ", (total_prom/total_grad))
FIN_ACCION

================================================================================================================

ACCION Ejer_2_3_7 ES
	AMBIENTE
		Persona = Registro
			nombre_apellido: AN(40)
			clase: N(4)
			dni: N(8)
			direccion: AN(30)
			nro_mesa: entero
			observaciones: AN(200)
			nro_circuito: entero
			partido = 0...3
		FinRegistro

		Persona_sal = Registro
			nombre_apellido: AN(40)
			dni: N(8)
			direccion: AN(30)
		FinRegistro

		padron: Archivo de Persona
		sal1: Archivo de Persona
		sal2: Archivo de Persona
		pers: Persona
		p_sal: Persona_sal

	PROCESO
		ABRIR E/ (padron)
		ABRIR /S (sal1)
		ABRIR /S (sal2)
		LEER(padron, pers)

		Mietras NFDA(padron) hacer
			Si pers.partido=3 entonces
				p_sal.nombre_apellido := pers.nombre_apellido
				p_sal.dni := pers.dni
				p_sal.direccion := pers.direccion
				ESCRIBIR(sal1, p_sal)

			Sino
				Si (pers.partido=0) y (pers.clase>1940) entonces 
					p_sal.nombre_apellido := pers.nombre_apellido
					p_sal.dni := pers.dni
					p_sal.direccion := pers.direccion
					ESCRIBIR(sal2, p_sal)
			FinSi

			LEER(padron, pers)
		FinMientras

		CERRAR(padron); CERRAR(sal1); CERRAR(sal2)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_3_8 ES
	AMBIENTE
		Fecha = Registro
			anio: N(4)
			mes: 1...12
			dia: 1...31
		FinRegistro

		Compra = Registro
			nro_cliente: entero
			fecha_ult_compra: Fecha
			monto: real
		FinRegistro

		Cliente = Registro
			nro_cliente: entero
			apellido_nombre: AN(40)
			domicilio: AN(100)
			telefono: N(10)
			dni: N(8)
		FinRegistro

		compras: Archivo de Compra ordenado por nro_cliente
		clientes: Archivo de Cliente ordenado por nro_cliente
		com: Compra
		cli: Cliente

		fech: Fecha
		montox: real

	PROCESO
		ABRIR E/ (compras); ABRIR E/ (clientes)
		LEER(compras, com); LEER(clientes, cli)

		ESCRIBIR("Ingrese la fecha deseada en formato: DD MM AAAA")
		LEER(fech.dia, fech.mes, fech.anio)
		ESCRIBIR("Ingrese el monto deseado: ")
		LEER(montox)

		Mientras NFDS(compras) hacer
			Si (com.fecha_ult_compra>fech) y (com.monto>montox) entonces
				ESCRIBIR("| ", cli.apellido_nombre, " | ", com.fecha_ult_compra.dia, "-", com.fecha_ult_compra.mes, "-", com.fecha_ult_compra.anio, " | ", com.monto, " |")
			FinSi
			LEER(compras, com); LEER(clientes, cli)
		FinMientras

		CERRAR(compras); CERRAR(clientes)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_3_9 ES
	AMBIENTE
		Producto = Registro
			cod_producto: entero
			tipo = (1, 2, 3)
			marca: AN(15)
			modelo: AN(15)
			descripcion: AN(200)
			cant_existente: entero
			precio_unit: real
		FinRegistro

		arch: Archivo de Producto ordenado por cod_producto
		sal: Archivo de Producto
		prod: Producto

		tipo1: entero; tipo2: entero; tipo3: entero

	PROCESO
		ABRIR E/ (arch); ABRIR /S (sal)
		LEER(arch, prod)

		tipo1 := 0; tipo2 := 0; tipo3 := 0

		Mientras NFDA(arch) hacer
			Segun prod.tipo hacer
				1:	prod.precio_unit := prod.precio_unit*1.1
					tipo1 := tipo1 + 1
				2:	prod.precio_unit := prod.precio_unit*1.25
					tipo2 := tipo2 + 1
				3:	prod.precio_unit := prod.precio_unit*1.5
					tipo3 := tipo3 + 1
			FinSegun
			ESCRIBIR(sal, prod)
			LEER(arch, prod)
		FinMientras

		ESCRIBIR("La cantidad de articulos de tipo 1 es de: ", tipo1)
		ESCRIBIR("La cantidad de articulos de tipo 2 es de: ", tipo2)
		ESCRIBIR("La cantidad de articulos de tipo 3 es de: ", tipo3)

		CERRAR(arch); CERRAR(sal)
FIN_ACCION

================================================================================================================
----------------------------------- CORTE DE CONTROL -----------------------------------------------------------
================================================================================================================

ACCION Ejer_2_3_10 ES
	AMBIENTE
		Fecha = Registro
			anio: N(4)
			mes: 1...12
			dia: 1...31
		FinRegistro

		Alumno = Registro
			apellido_nombre: AN
			carrera = ("ISI", "IQ", "IEM", "LAR")
			legajo: N(5)
			fecha_nacimiento: Fecha
			fecha_ingreso: Fecha
			dni: N(8)
			sexo = ("F", "M")
			fecha_ult_examen_aprob: Fecha
			nota: N(1.2)
		FinRegistro

		PROCEDIMIENTO corte() ES
			PROCESO
				ESCRIBIR("La cantidad de alumnos en la carrera de ", resg_carrera, " es de: ", cant)
				total := total + cant
				cant := 0
				resg_carrera := al.carrera
		FIN_PROCEDIMIENTO

		arch: Archivo de Alumno ordenado por carrera
		al: Alumno

		resg_carrera = ("ISI", "IQ", "IEM", "LAR")
		cant: entero

	PROCESO
		ABRIR E/ (arch)
		LEER(arch, al)

		cant := 0; total := 0
		resg_carrera := al.carrera

		Mientras NFDA(arch) hacer
			Si al.carrera<>resg_carrera entonces
				corte()
			FinSi

			cant := cant + 1
			LEER(arch, al)
		FinMientras

		corte()
		ESCRIBIR("El total de alumnos es de: ", total)
		CERRAR(arch)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_3_11 ES
	AMBIENTE
		Alumno = Registro
			sexo = ("F", "M")
			carrera = ("ISI", "IQ", "IEM", "LAR")
			legajo: N(5)
			fecha_ingreso = Registro
				anio: N(4)
				mes: 1...12
				dia: 1...31
			FinRegistro
			total_materias_aprob: entero
		FinRegistro

		arch: Archivo de Alumno ordenado por sexo, carrera, legajo
		al: Alumno

		resg_sexo = ("F", "M")
		resg_carrera = ("ISI", "IQ", "IEM", "LAR")
		cant_carrera_menor_20: entero
		cant_carrera_mayor_20: entero
		cant_sexo_mayor_20: entero
		cant_sexo_menor_20: entero
		total_mayor_20: entero
		total_menor_20: entero

		PROCEDIMIENTO corte1() ES
			PROCESO
				ESCRIBIR("El total de alumnos ingresados en el año 2009 con mas de 20 materias aprobadas en la carrera de ", resg_carrera, " es de: ", cant_carrera_mayor_20)
				ESCRIBIR("El total de alumnos ingresados en el año 2009 con menos de 20 materias aprobadas en la carrera de ", resg_carrera, " es de: ", cant_carrera_menor_20)
				cant_sexo_mayor_20 := cant_sexo_mayor_20 + cant_carrera_mayor_20
				cant_sexo_menor_20 := cant_sexo_menor_20 + cant_carrera_menor_20
				cant_carrera_menor_20 := 0
				cant_carrera_mayor_20 := 0
				resg_carrera := al.carrera
		FIN_PROCEDIMIENTO

		PROCEDIMIENTO corte2() ES
			PROCESO
				corte1()
				ESCRIBIR("El total de alumnos ingresados en el año 2009 con mas de 20 materias aprobadas de sexo ", resg_sexo, " es de: ", cant_sexo)
				ESCRIBIR("El total de alumnos ingresados en el año 2009 con menos de 20 materias aprobadas de sexo ", resg_sexo, " es de: ", cant_sexo)
				total_mayor_20 := total_mayor_20 + cant_sexo_mayor_20
				total_menor_20 := total_menor_20 + cant_sexo_menor_20
				cant_sexo_mayor_20 := 0
				cant_sexo_menor_20 := 0
				resg_sexo := al.sexo
		FIN_PROCEDIMIENTO

	PROCESO
		ABRIR(arch); LEER(arch, al)

		resg_sexo := al.sexo; resg_carrera := al.carrera
		
		cant_carrera_mayor_20 := 0; cant_carrera_menor_20 := 0
		cant_sexo_mayor_20 := 0; cant_sexo_menor_20 := 0
		total_mayor_20 := 0; total_menor_20 := 0

		Mientras NFDA(arch) hacer
			Si al.sexo<>resg_sexo entonces
				corte2()
			Sino
				Si al.carrera<>resg_carrera entonces
					corte1()
				FinSi
			FinSi

			Si al.fecha_ingreso.anio=2009 entonces
				Segun al.total_materias_aprob hacer
					<20:	cant_carrera_menor_20 := cant_carrera_menor_20 + 1
					>20:	cant_carrera_mayor_20 := cant_carrera_mayor_20 + 1
				FinSegun
			FinSi

			LEER(arch, al)
		FinMientras

		corte2()
		ESCRIBIR("El total de alumnos ingresados en el año 2009 con menos de 20 materias aprobadas es de: ", total_menor_20)
		ESCRIBIR("El total de alumnos ingresados en el año 2009 con mas de 20 materias aprobadas es de: ", total_mayor_20)
		CERRAR(arch)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_3_12 ES
	AMBIENTE
		Casa = Registro
			provincia: AN(50)
			departamento: AN(50)
			ciudad: AN(50)
			barrio: AN(50)
			id_casa: entero
			habitantes: entero
		FinRegistro

		Casa_sal = Registro
			provincia: AN(50)
			departamento: AN(50)
			cant_habitantes: entero
		FinRegistro

		arch: Archivo de Casa ordenado por provincia, departamento, ciudad, barrio, id_casa
		sal: Archivo de Casa_sal 
		c: Casa
		c_sal: Casa_sal

		resg_provincia: AN(50)
		resg_departamento: AN(50)
		habitantes_depto: entero

		PROCEDIMIENTO corte_departamento() ES
			PROCESO
				c_sal.provincia := resg_provincia
				c_sal.departamento := resg_departamento
				c_sal.cant_habitantes := habitantes_depto
				ESCRIBIR(sal, c_sal)

				habitantes_depto := 0
				resg_departamento := c.departamento
		FIN_PROCEDIMIENTO

		PROCEDIMIENTO corte_provincia() ES
			PROCESO
				corte_departamento()
				resg_provincia := c.provincia
		FIN_PROCEDIMIENTO

	PROCESO
		ABRIR E/ (arch); ABRIR /S (sal)	
		LEER(arch, c)

		resg_provincia := c.provincia
		resg_departamento := c.departamento

		Mientras NFDA(arch) hacer
			Si resg_provincia<>c.provincia entonces
				corte_provincia()
			Sino
				Si resg_departamento<>c.departamento entonces
					corte_departamento()
				FinSi
			FinSi

			habitantes_depto := habitantes_depto + 1
			LEER(arch, c)
		FinMientras

		corte_provincia()
		CERRAR(arch); CERRAR(sal)
FIN_ACCION

================================================================================================================

ACCION Ejer_2_3_13 ES
	AMBIENTE
		Reparacion = Registro
			cod_sucursal: entero
			marca: AN(20)
			modelo: AN(20)
			cod_tragamonedas: entero
			fecha_reparacion = Registro
				anio: N(4)
				mes: 1...12
				dia: 1...31
			FinRegistro
			costo_reparacion: real
		FinRegistro

		arch: Archivo de Reparacion
		rep: Reparacion

		resg_tragamonedas: entero
		resg_modelo: AN(20)
		resg_marca: AN(20)
		resg_sucursal: entero

		rep_tragamonedas: entero; rep_modelo: entero; rep_marca: entero; rep_sucursal: entero; rep_total: entero
		costo_tragamonedas: real; costo_modelo: real; costo_marca: real; costo_sucursal: real; costo_total: real
		
		PROCEDIMIENTO corte_tragamonedas() ES
			PROCESO
				ESCRIBIR("El tragamonedas ", resg_tragamonedas, " tuvo ", rep_tragamonedas, " reparaciones, con un costo total de $", costo_tragamonedas)
				
				rep_modelo := rep_modelo + rep_tragamonedas
				costo_modelo := costo_modelo + costo_tragamonedas
				resg_tragamonedas := rep.cod_tragamonedas
				
				rep_tragamonedas := 0
				costo_tragamonedas := 0 
		FIN_PROCEDIMIENTO

		PROCEDIMIENTO corte_modelo() ES
			PROCESO
				corte_tragamonedas()
				ESCRIBIR("El modelo de tragamonedas ", resg_mdoelo, " tuvo un total de ", rep_modelo, " reparaciones, con un costo de $", costo_modelo)

				rep_marca := rep_marca + rep_modelo
				costo_marca := costo_marca + costo_modelo
				resg_modelo := rep.modelo

				rep_modelo := 0
				costo_modelo := 0
		FIN_PROCEDIMIENTO

		PROCEDIMIENTO corte_marca() ES
			PROCESO
				corte_modelo()
				ESCRIBIR("La marca de tragamonedas ", resg_marca, " tuvo un total de ", rep_marca, " reparaciones, con un costo de $", costo_marca)

				rep_sucursal := rep_sucursal + rep_marca
				costo_sucursal := costo_sucursal + costo_marca
				resg_marca := rep.marca

				rep_marca := 0
				costo_marca := 0
		FIN_PROCEDIMIENTO

		PROCEDIMIENTO corte_sucursal() ES
			PROCESO
				corte_marca()
				ESCRIBIR("En la sucursal ", resg_sucursal, " hubo un total de ", rep_sucursal, " reparaciones, con un costo de $", costo_sucursal)

				rep_total := rep_total + rep_sucursal
				costo_total := costo_total + costo_sucursal
				resg_sucursal := rep.cod_sucursal

				rep_sucursal := 0
				costo_sucursal := 0
		FIN_PROCEDIMIENTO

	PROCESO
		ABRIR(arch); LEER(arch, rep)

		rep_tragamonedas := 0; rep_modelo := 0; rep_modelo := 0; rep_sucursal := 0; rep_total := 0
		costo_tragamonedas := 0; costo_modelo := 0; costo_marca := 0; costo_sucursal := 0; costo_total := 0

		resg_sucursal := rep.sucursal
		resg_marca := rep.marca
		resg_modelo := rep.modelo
		resg_tragamonedas := rep.cod_tragamonedas

		Mientras NFDA(arch) hacer
			Si rep.sucursal <> resg_sucursal entonces
				corte_sucursal()
			Sino
				Si rep.marca <> resg_marca entonces
					corte_marca()
				Sino
					Si rep.modelo <> resg_mdoelo entonces
						corte_modelo()
					Sino
						Si rep.cod_tragamonedas <> resg_tragamonedas entonces
							corte_tragamonedas()
						FinSi
					FinSi
				FinSi
			FinSi

			rep_tragamonedas := rep_tragamonedas + 1
			costo_tragamonedas := costo_tragamonedas + rep.costo_reparacion
			LEER(arch, rep)
		FinMientras

		corte_sucursal()
		ESCRIBIR("El total de reparaciones es de ", rep_total, ", con un costo de $", costo_total)
		CERRAR(arch)
FIN_ACCION

================================================================================================================
# HECHO EN LA CARPETA - COPIAR	
ACCION Ejer_2_3_14 ES
	AMBIENTE
		
	PROCESO
		
FIN_ACCION

================================================================================================================

ACCION Ejer_2_3_15 ES
	AMBIENTE
		Alulmno = Registro
			escuela: AN(20)
			anio: N(1)
			division: AN(1)
			nombre: AN(20)
			inasistencias: entero
		FinRegistro
		
		arch: Archivo de Alumno ordenado por escuela, anio, division
		al: Alumno

		distrito: entero
		dias_clase: entero

		al_lib_anio: entero
		al_reg_anio: entero
		al_lib_total: entero

		cant_al_division: entero
		cant_al_anio: entero
		cant_al_total: entero

		PROCEDIMIENTO corte_division() ES
			PROCESO
				ESCRIBIR("Cantidad de alumnos en la division ", resg_division, ": ", cant_al_division)
				cant_al_anio := cant_al_anio + cant_al_division
				resg_division := al.division
				cant_al_division := 0
		FIN_PROCEDIMIENTO

		PROCEDIMIENTO corte_anio() ES
			PROCESO
				corte_division()
				ESCRIBIR("Cantidad de alumnos libres del año ", resg_anio, ": ", al_lib_anio)
				ESCRIBIR("Cantidad de alumnos regulares del año ", resg_anio, ": ", al_reg_anio)
				ESCRIBIR("Cantidad total de alumnos del año ", resg_anio, ": ", cant_al_anio)

				cant_al_total := cant_al_total + cant_al_anio
				resg_anio := al.anio
				cant_al_anio := 0
		FIN_PROCEDIMIENTO

	PROCESO
		ABRIR(arch); LEER(arch, al)

		al_lib_anio, al_reg_anio, al_lib_total := 0
		cant_al_division, cant_al_anio, cant_al_total := 0

		resg_division := al.division
		resg_anio := al.anio
		resg_escuela := al.escuela

		ESCRIBIR("Ingrese el numero del distrito: "); LEER(distrito)
		ESCRIBIR("Ingrese el numero de dias de clases dictados en el año: "); LEER(dias_clase)

		Mientras NFDA(arch) hacer
			# Tratar corte
			Si al.escuela <> resg_escuela entonces
				corte_anio()
			Sino
				Si al.anio <> resg_anio entonces
					corte_anio()
				Sino
					Si al.division <> resg_division entonces
						corte_division()
					FinSi
				FinSi
			FinSi

			# Tratar registro
			cant_al_division := cant_al_division + 1
			inasistencias := inasistencias + al.inasistencias
			Si (al.inasistencias/dias_clase)>0.2 entonces
				al_lib_anio := al_lib_anio + 1
			Sino
				al_reg_anio := al_reg_anio + 1
			FinSi

			# Llamar corte mayor
			corte_anio()

			# Emitir totales
			ESCRIBIR("La cantidad total de alumnos en el distrito ", distrito, " es de ", cant_al_total)
			ESCRIBIR("El porcentaje de alumnos libres es de ", ((cant_al_lib/cant_al_total)*100), "%")
			ESCRIBIR("El promedio de inasistencias por alumno es de ", (inasistencias DIV cant_al_total))

			CERRAR(arch)
FIN_ACCION

================================================================================================================