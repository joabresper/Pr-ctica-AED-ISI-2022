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

ACCION Ejer_2_1_16 ES @@@@@@@@@@@@@@@@@@@@@@@@@@@@
	AMBIENTE
		sec: secuencia de entero #Secuencia de entrada
		salida: secuencia de entero #Secuencia de salida
		v: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)
		CREAR(salida)

		Mientras no FDS(sec) hacer
			Si (v MOD 3) = 0 entonces
				ESCRIBIR(salida, v)
			FinSi
			AVANZAR(sec)
		FinMientras
		CERRAR(salida)
		CERRAR(sec)
		# MAL - ESCRIBIR(salida)


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


		
