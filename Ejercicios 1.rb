Ejercicio_1_1_3

"Una ACCION es un acontecimiento producido por un actor, que tiene lugar durante un período de tiempo FINITO y produce un RESULTADO bien determinado."
"El instante de ... de la acción se denomina Ti y el instante de ... se denomina Tf."
"El conjunto de los valores en el instante t dado del desarrollo del acontecimiento se denomina ... en el instante t."

===============================================================================================================

Ejercicio_1_1_4

1 - "Conjunto de fenómenos organizados en el tiempo y concebido como activo" - "PROCESO"
2 - "Descripción de un esquema de comportamiento" - "ALGORITMO"
3 - "Algoritmo destinado a gobernar una máquina real" - "PROGRAMA"
4 - "Mecanismo capaz de generar acciones que tienen lugar según un esquema determinado" - "MÁQUINA"

===============================================================================================================

ACCION Ejercicio_1_1_5_1 ES
    AMBIENTE
        precio_actual: real
        precio_futuro: real
        anio_futuro: entero
        anio_actual: entero
        tasa_inflacion: real
        
    PROCESO
        anio_actual := 2022
        tasa_inflacion := 0.04

        ESCRIBIR("Ingrese el año futuro para calcular el precio teniendo en cuenta la inflacion")
        LEER(anio_futuro)

        ESCRIBIR("Ingrese el precio actual del producto")
        LEER(precio_actual)

        precio_futuro := precio_actual * (1 + tasa_inflacion)**(anio_futuro - anio_actual)

        ESCRIBIR("El precio del producto en el año ", anio_futuro, "será de $", precio_futuro)
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_5_2 ES
    AMBIENTE
        a: real
        b: real
        c: real
        discriminante: real

    PROCESO
        ESCRIBIR("Ingrese el valor del coeficiente 'a'")
        LEER(a)
        ESCRIBIR("Ingrese el valor del coeficiente 'b'")
        LEER(b)
        ESCRIBIR("Ingrese el valor del coeficiente 'c'")
        LEER(c)

        discriminante := 2*b - 4*a*c

        ESCRIBIR("El valor del discriminante es ", discriminante)
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_5_3 ES
    AMBIENTE
        precio_pc: real
        precio_impresora: real
        precio_total: real
        IVA: real
        ganancia_vend_pc: real
        ganancia_vend_impresora: real

    PROCESO
        IVA := 0.21
        ganancia_vend_impresora := 0.07
        ganancia_vend_pc := 0.12

        ESCRIBIR("Ingrese el costo de la PC")
        LEER(precio_pc)

        ESCRIBIR("Ingrese el costo de la impresora")
        LEER(precio_impresora)

        precio_total := precio_pc*(1+ganancia_vend_pc+IVA)+precio_impresora*(1+ganancia_vend_impresora+IVA)

        ESCRIBIR("El costo total por la venta de una PC y una Impresora es de $", precio_total)
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_5_4 ES
	AMBIENTE
        base1: real
        base2: real
        altura: real
        superficie: real

    PROCESO
        // Calcula la superficie de un trapecio

        ESCRIBIR("Ingrese la longitud de las bases y la altura del trapecio en centimetros: ")
        LEER(base1, base2, altura)

        superficie := (base1 + base2)*altura/2

        ESCRIBIR("Para los valores ingresados: Base1=", base1, "; Base2=", base2, "; Altura=", altura)
        ESCRIBIR("La superficie del trapecio es de ", superficie, "centimetros cuadrados.")
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_5_5 ES
    AMBIENTE
        S: real
        I: real
        C: real

    PROCESO
        // Calcula la seccion de un conductor teniendo en cuenta los valores de conductividad del material y la corriente electrica

        ESCRIBIR("Ingrese los valores de Conductividad del material (C) y de la Corriente electrica (I): ")
        LEER(C, I)

        S := (I/C)*1.25

        ESCRIBIR("La seccion del conductor incrementada en un 25% por razones de seguridad, es de ", S)
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_5_6 ES
    AMBIENTE
        real1: real
        imag1: real
        real2: real
        imag2: real
        producto_real: real
        producto_imag: real

    PROCESO
        // Calcula el producto de dos numeros complejos

        ESCRIBIR("Ingrese la parte real y luego la parte imaginaria del primer numero complejo")
        LEER(real1, imag1)

        ESCRIBIR("Ingrese la parte real y luego la parte imaginaria del segundo numero complejo")
        LEER(real2, imag2)

        producto_real := real1*real2 - imag1*imag2
        producto_imag := real1*imag2 + real2*imag1

        ESCRIBIR("Del producto de los dos numeros complejos se obtiene: ", producto_real, "+ ", producto_imag, "i")
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_5_7 ES
    AMBIENTE
        nro1: real
        nro2: real
        nro3: real
        media: real
    
    PROCESO
        // Calcula la media geometrica de tres valores
        ESCRIBIR("Ingrese 3 valores para calcular la media geometrica entre ellos")
        LEER(nro1, nro2, nro3)

        media := (nro1 + nro2 + nro3)/3

        ESCRIBIR("La media geometrica entre: ", nro1, ", ", nro2, " y ", nro3, " es ", media)
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_6 ES
    AMBIENTE
        nro1: real
        nro2: real
        nro3: real
        mayor: real
        medio: real
        menor: real

    PROCESO
        // determina el orden de mayor a menor de 3 numeros ingresados

        ESCRIBIR("Ingrese tres numeros para ordenarlos de mayor a menor: ")
        LEER(nro1, nro2, nro3)

        Segun nro1 hacer
            >nro2 y >nro3 : ESCRIBIR("El valor mayor es: ", nro1)
                            Segun nro2 hacer
                                >nro3 : ESCRIBIR("El valor medio es: ", nro2)
                                        ESCRIBIR("El valor menor es: ", nro3)

                                <nro3 : ESCRIBIR("El valor medio es: ", nro3)
                                        ESCRIBIR("El valor menor es: ", nro2)

                            Otro    
                                ESCRIBIR("Los valores: ", nro2, " y ", nro3, " son iguales, menores a ", nro1)
                            FinSegun

            <nro2 y <nro3 : ESCRIBIR("El valor menor es: ", nro1)
                            Segun nro2 hacer
                                >nro3 : ESCRIBIR("El valor mayor es: ", nro2)
                                        ESCRIBIR("El valor medio es: ", nro3)

                                <nro3 : ESCRIBIR("El valor mayor es: ", nro3)
                                        ESCRIBIR("El valor medio es: ", nro2)

                            Otro    
                                ESCRIBIR("Los valores: ", nro2, " y ", nro3, " son iguales, mayores a ", nro1)
                            FinSegun
            
            >nro2 y <nro3 : ESCRIBIR("El valor mayor es: ", nro3)
                            ESCRIBIR("El valor medio es ", nro1)
                            ESCRIBIR("El valor menor es: ", nro2)
            
            <nro2 y >nro3 : ESCRIBIR("El valor mayor es: ", nro2)
                            ESCRIBIR("El valor medio es ", nro1)
                            ESCRIBIR("El valor menor es: ", nro3)
                    
            =nro2 y =nro3 : ESCRIBIR("Los tres numeros son iguales: ", nro1, ", ", nro2, " y ", nro3)

            =nro2 : Segun nro1 hacer
                        >nro3 : ESCRIBIR("El valor menor es: ", nro3)
                                ESCRIBIR("Los valores: ", nro1, " y ", nro2, " son iguales, mayores a ", nro3)

                        <nro3 : ESCRIBIR("El valor mayor es: ", nro3)
                                ESCRIBIR("Los valores: ", nro1, " y ", nro2, " son iguales, menores a ", nro3)
                    FinSegun

            =nro3 : Segun nro1 hacer
                        >nro2 : ESCRIBIR("El valor menor es: ", nro2)
                                ESCRIBIR("Los valores: ", nro1, " y ", nro3, " son iguales, mayores a ", nro2)

                        <nro2 : ESCRIBIR("El valor mayor es: ", nro2)
                                ESCRIBIR("Los valores: ", nro1, " y ", nro3, " son iguales, menores a ", nro2)
                    FinSegun
        FinSegun   
FIN_ACCION                        

================================================================================================================

ACCION Ejercicio_1_1_7 ES
	AMBIENTE
		nro1: entero
		nro2: entero
		resultado: entero

	PROCESO
		ESCRIBIR("Ingrese primer numero entero")
		LEER(nro1)

		ESCRIBIR("Ingrese segundo numero entero")
		LEER(nro2)

		resultado := nro1 + nro2

		Segun resultado hacer
			<=50: ESCRIBIR("La suma de ", nro1, " y ", nro2,  "es menor o igual a 50.")
			<=100: ESCRIBIR("La suma de ", nro1, " y ", nro2,  "es mayor a 50 pero menor o igual a 100.")
			<=200: ESCRIBIR("La suma de ", nro1, " y ", nro2,  "es mayor a 100 pero menor o igual a 200.")
		Otro
            ESCRIBIR("La suma de ", nro1, " y ", nro2,  "es mayor a 200.")
		FinSegun
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_8 ES
	AMBIENTE
		dia_nacimiento: entero
		mes_nacimiento: entero
		anio_nacimiento: entero
		dia_actual: entero
		mes_actual: entero
		anio_actual: entero
		edad: entero
	
	PROCESO
		ESCRIBIR("Algoritmo que calcula la edad de una persona")

		ESCRIBIR("Ingrese dia, mes y año de nacimiento, separados por un espacio")
		LEER(dia_nacimiento, mes_nacimiento, anio_nacimiento)

		ESCRIBIR("Ingrese dia, mes y año actual, separados por un espacio")
		LEER(dia_actual, mes_actual, anio_actual)

		Si mes_actual >= mes_nacimiento entonces
			Si dia_actual >= dia_nacimiento entonces
				edad := anio_actual - anio_nacimiento
			Sino
				edad := anio_actual - anio_nacimiento - 1
			FinSi
		Sino
			edad := anio_actual - anio_nacimiento - 1
		FinSi

		ESCRIBIR("Su edad es: ", edad)
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_9 ES
	AMBIENTE
		eur_necesarios: real 
		usd_necesarios: real
		usd_ahorrados: real
		diferencia: real
		usd_eur: real
		ars_usd: real

	PROCESO
		ESCRIBIR("Calcula si es posible realizar un viaje a Europa")

		ESCRIBIR("Ingrese la cantidad de euros necesaria")
		LEER(eur_necesarios)

		ESCRIBIR("Ingrese la cantidad de dolares ahorrados")
		LEER(usd_ahorrados)

		ESCRIBIR("Ingrese la equivalencia USD/EUR")
		LEER(usd_eur)

		ESCRIBIR("Ingrese la equivalencia ARS/USD")
		LEER(ars_usd)

		usd_necesarios := eur_necesarios*usd_eur

		Si usd_necesarios = usd_ahorrados entonces
			ESCRIBIR("PUEDES REALIZAR EL VIAJE!! El dinero ahorrado es el necesario para realizarlo")
		Sino
			Si usd_necesarios < usd_ahorrados entonces
				diferencia := (usd_ahorrados - usd_necesarios)*ars_usd
				ESCRIBIR("PUEDES REALIZAR EL VIAJE!! El dinero ahorrado es suficiente para realizar el viaje y tiene un ahorro extra de ", diferencia, "pesos")
			Sino
				diferencia := (usd_necesarios - usd_ahorrados)*ars_usd
				ESCRIBIR("NO PUEDES REALIZAR EL VIAJE!! El dinero ahorrado no es suficiente para realizar el viaje, faltan ", diferencia, "pesos")
			FinSi
		FinSi
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_10 ES
	AMBIENTE
        A: entero
        B: entero

    PROCESO
        Si (A MOD B)=0 entonces
            Si (B MOD A)=0 entonces
                ESCRIBIR(A, " es divisor de ", B, " y ", B, " es divisor de ", A)
            Sino
                ESCRIBIR(A, " es divisor de ", B, " pero ", B, " no es divisor de ", A)
            FinSi
        Sino
            Si (B MOD A)=0 entonces
                ESCRIBIR(A, " no es divisor de ", B, " pero ", B, " si es divisor de ", A)
            Sino
                ESCRIBIR(A, " no es divisor de ", B, " ni ", B, " es divisor de ", A)
        FinSi
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_11 ES
    AMBIENTE
        anio_actual: entero
        anio_incognita: entero

    PROCESO
        ESCRIBIR("Ingrese el año actual")
        LEER(anio_actual)
        ESCRIBIR("Ingrese un año cualquiera")
        LEER(anio_incognita)

        Segun anio_incognita hacer
            >anio_actual : ESCRIBIR("FUTURO")
            <anio_actual : ESCRIBIR("PASADO")
            =anio_actual : ESCRIBIR("ACTUAL")
        FinSegun
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_12 ES
    AMBIENTE
        num: 101...999
        unidad: entero
        decena: entero
        centena: entero

    PROCESO
        ESCRIBIR("Ingrese un numero entero mayor a 100 y menor a 1000")
        LEER(num)

        centena := num DIV 100
        decena := (num MOD 100) DIV 10
        unidad := num MOD 10

        ESCRIBIR("El numero está compuesto por: Unidades=", unidad, ", Decenas=", decena, ", Centenas=", centena)

        Si (unidad + decena + centena) MOD 3 = 0 entonces
            ESCRIBIR("El numero es multiplo de 3")
        Sino
            ESCRIBIR("El numero no es multiplo de 3")
        FinSi
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_13 ES
    AMBIENTE
        num: 101...999
        billete1: entero
        billete10: entero
        billete100: entero

    PROCESO
        ESCRIBIR("Ingrese una suma de dinero entera mayor a 100 y menor a 1000")
        LEER(num)

        billete100 := num DIV 100
        billete10 := (num MOD 100) DIV 10
        billete1 := num MOD 10

        ESCRIBIR("La suma de dinero está compuesta por ", billete100, " billetes de 100 pesos, ", billete10, " billetes de 10 pesos y ", billete1, " billetes de 1 peso")
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_15 ES
    AMBIENTE
        cantidad_pisos: entero
        altura_piso_metros: real
        altura_edificio: real
		respuesta: alfanumerico

		pie_metro = 3.28

    PROCESO
		ESCRIBIR("Desea comenzar el calculo? - si o no")
		LEER(respuesta)
        
		Mientras respuesta = "si" hacer
        	ESCRIBIR("Ingrese la cantidad de pisos del edificio ")
        	LEER(cantidad_pisos)
        	ESCRIBIR("Ingrese la altura promedio de cada piso, en metros")
        	LEER(altura_piso_metros)
        
			altura_edificio := altura_piso_metros*pie_metro*cantidad_pisos

			ESCRIBIR("La altura promedio del edificio ", vc, " es de ", altura_edificio, " pies.")
			ESCRIBIR("Desea continuar con el calculo? - si o no")
			LEER(respuesta)
		FinMientras
FIN_ACCION

?================================================================================================================

ACCION Ejercicio_1_1_16 ES
	AMBIENTE

	PROCESO
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_17 ES
	AMBIENTE
		nro1: entero
		nro2: entero
		producto: entero

	PROCESO
		ESCRIBIR("Ingrese dos numeros enteros para calcular su producto")
		LEER(nro1, nro2)

		producto := 0
		Para nro1 hasta 1, -1 hacer
			producto := producto + nro2
		
		ESCRIBIR("El producto de ", nro1, " y ", nro2, " es ", producto)
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_18 ES
	AMBIENTE
		dividendo: entero
		divisor: entero
		cociente: entero

	PROCESO
		ESCRIBIR("Calcula el la division entera entre dos numeros enteros")
		ESCRIBIR("Ingrese el valor de DIVIDENDO y luego del DIVISOR")
		LEER(dividendo, divisor)

		cociente := 0

		Mientras dividendo>divisor hacer
			dividendo := dividendo - divisor
			cociente := cociente + 1
		FinMientras

		ESCRIBIR("El resultado de la division entera es: ", cociente, " y el resto: ", dividendo)

================================================================================================================

ACCION Ejercicio_1_1_19 ES
	AMBIENTE
		variable: real
		cuadrado: real
		cubo: real

	PROCESO
		ESCRIBIR8("Ingresar un valor cualquiera para obtener su CUADRADO y su CUBO")
		LEER(variable)

		cuadrado := variable**2
		cubo := variable**3

		ESCRIBIR("El valor ingresado es: ", variable, ", su cuadrado: ", cuadrado, ", y su cubo: ", cubo)
FIN_ACCION

?================================================================================================================

ACCION Ejercicio_1_1_20 ES
	AMBIENTE
	variable: real
	cuadrado: real
	cubo: real

	PROCESO
		ESCRIBIR8("Ingresar un valor cualquiera para obtener su CUADRADO y su CUBO, y tambien de los suiguientes 10 valores")
		LEER(variable)

		Para vc := variable hasta (variable+10), 1 hacer
			cuadrado := vc**2
			cubo := vc**3

			ESCRIBIR("Valor: ", variable, ", su cuadrado: ", cuadrado, ", su cubo: ", cubo)
		FinPara
FIN_ACCION

?================================================================================================================

ACCION Ejercicio_1_1_21 ES
	AMBIENTE
		variable: real
		n_incrementos: entero
		cuadrado: real
		cubo: real
		suma_cuadrado: real

	PROCESO
		ESCRIBIR8("Ingresar un valor cualquiera")
		LEER(variable)
		ESCRIBIR("Ingrese un valor entero que representa el nro de incrementos del valor anterior")
		LEER(n_incrementos)
		suma_cuadrado := 0

		Para vc := variable hasta (variable+n) hacer
			cuadrado := vc**2
			cubo := vc**3
			suma_cuadrado := suma_cuadrado + cuadrado

			ESCRIBIR("El valor ingresado es: ", variable, ", su cuadrado: ", cuadrado, ", y su cubo: ", cubo)
		FinPara
		ESCRIBIR("La suma total de los cuadrados es: ", suma_cuadrado)
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_22 ES
	AMBIENTE
		numero: entero
		es_primo: logico
		vc: entero
	PROCESO
		ESCRIBIR("Ingrese un numero entero para averiguar si es un numero primo")
		LEER(numero)

		es_primo := verdadero

		Para vc := 2 hasta (entero-1), 1 hacer
			Si numero MOD vc = 0 entonces
				es_primo := falso
			FinSi
		FinPara

		Si numero = 2 entonces
			ESCRIBIR("El numero ", numero, " es primo.")
		Sino
			Si es_primo = verdadero
				ESCRIBIR("El numero ", numero, " es primo.")
			Sino
			ESCRIBIR("El numero ", numero, " NO es primo.")
			FinSi
		FinSi
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_23 ES
	AMBIENTE
		valor_unitario: real
		cantidad_vendida: entero
		total_renglon: real
		total_factura: real
		continuar: alfanumerico
	
	PROCESO
		ESCRIBIR("Programa que devuelve el total de una factura")
		total_factura := 0

		ESCRIBIR("Desea iniciar el calculo? (si/no)")
		LEER(continuar)

		total_factura := 0

		Mientras continuar = "si" hacer
			ESCRIBIR("El valor unitario y la cantidad vendida")
			LEER(valor_unitario, cantidad_vendida)

			Mientras valor_unitario <= 0 hacer
				ESCRIBIR("ERROR! Valor unitario inadmisible. Debe ingresar un valor mayor a cero")
				ESCRIBIR("Ingrese nuevamente el valor unitario")
				LEER(valor_unitario)
			FinMientras

			total_renglon := valor_unitario*cantidad_vendida
			total_factura := total_factura + total_factura

			ESCRIBIR("Total renglon: ", total_renglon)
			ESCRIBIR("Desea continuar con el calculo? (si/no)")
			LEER(continuar)
		FinMientras

		ESCRIBIR("El total de la factura es de: ", total_factura)
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_24 ES
	AMBIENTE
		importe: real
		IMPUESTO: real
		total_impuesto: real
		cuota: real
		continuar: entero


	PROCESO
		ESCRIBIR("Calcula los montos a pagar segun impuesto y cuotas")

		IMPUESTO := 0.10

		Repetir
			ESCRIBIR("Ingrese el importe")
			LEER(importe)

			total_impuesto := importe*IMPUESTO

			Segun importe hacer
				<500: ESCRIBIR("Debe pagar 1 cuota de: ", importe, " mas impuesto de: ", total_impuesto)

				<=1000: cuota := importe/2
						ESCRIBIR("Debe pagar 2 cuotas de: ", cuota, " mas impuesto de: ", total_impuesto)

				>1000: cuota := importe/3
						ESCRIBIR("Debe pagar 3 cuotas de: ", cuota, " mas impuesto de: ", total_impuesto)
			FinSegun

			ESCRIBIR("Para continuar con otro importe ingrese 1. Para finalizar ingrese 9999")
			LEER(continuar)
		Hasta que continuar=9999
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_25 ES
	AMBIENTE
		anterior1: entero
		anterior2: entero
		numero: entero
		vc: entero

	PROCESO
		ESCRIBIR("Primeros 50 elementos de la Sucesion de Fibonacci")
		anterior1 := 0
		anterior2 := 1

		ESCRIBIR(anterior1)
		ESCRIBIR(anterior2)

		Para vc := 1 hasta 48, hacer
			numero := anterior1 + anterior2
			ESCRIBIR(numero)
			anterior1 := anterior2
			anterior2 := numero
		FinPara
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_26 ES
	AMBIENTE
		X: real
		Y: real
		a: real
		b: real
		c: real
		i: -20...20

	PROCESO
		ESCRIBIR("Ingrese los valores de los coeficientes de la funcion cuadratica: a, b y c")
		LEER(a, b, c)

		Para i := 20 hasta -20, -2 hacer
			X := i
			Y := a*(X**2) + b*X + c

			ESCRIBIR(X, ", ", Y)
		FinPara
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_27 ES
	AMBIENTE
		X: real
		Y: real
		a: real
		b: real
		c: real
		i: -20...20
		continuar: alfanumerico

	PROCESO
		ESCRIBIR("Desea iniciar el programa? (si/no)")
		LEER(continuar)
		
		Mientras continuar = "si" hacer
			ESCRIBIR("Ingrese los valores de los coeficientes de la funcion cuadratica: a, b y c")
			LEER(a, b, c)

			Para i := 20 hasta -20, -2 hacer
				X := i
				Y := a*(X**2) + b*X + c

				ESCRIBIR(X, ", ", Y)
			FinPara

			ESCRIBIR("Desea continuar el calculo para otra funcion cuadratica diferente? (si/no)")
			LEER(continuar)
		FinMientras
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_28 ES
	AMBIENTE
		unidad: entero
		decena: entero
		centena: entero
		vc: 100...999

	PROCESO
		ESCRIBIR("Algoritmo capaz de encontrar todas las cifras de tres dígitos que cumplan con la condición de que la suma de los cubos de sus dígitos sea igual al 	número que la cifra representa.")

		Para vc := 100 hasta 999, hacer
			centena := vc DIV 100
        	decena := (vc MOD 100) DIV 10
        	unidad := vc MOD 10

			Si (unidad**3 + decena**3 + centena**3) = vc entonces
				ESCRIBIR("el numero ", vc, " cumple con la condicion")
			Sino	
				ESCRIBIR("El numero ", vc, " NO cumple con la condicion")
		FinPara
FIN_ACCION


================================================================================================================

ACCION Ejercicio_1_1_29 ES
	AMBIENTE
		limite: entero
		es_primo: logico
		vc1: entero
		vc2: entero

	PROCESO
		# Escriba un algoritmo para imprimir los números primos menores a un valor dado n.
		ESCRIBIR("Ingrese un numero entero")
		LEER(limite)

		es_primo := verdadero

		Para vc1 := 2 hasta (limite-1), hacer
			Para vc2 := 2 hasta (vc1-1), hacer
				Si vc1 MOD vc2 = 0 entonces
					es_primo := falso
				FinSi
			FinPara

			Si vc1 = 2 entonces
				ESCRIBIR(vc1)
			Sino
				Si es_primo = verdadero entonces
					ESCRIBIR(vc1)
				FinSi
			FinSi
		FinPara
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_30 ES
	AMBIENTE
		categoria: 1...2
		asistencia: ("si", "no")
		antiguedad: entero
		sueldo: real
		vc: entero

		SUELDO_BASICO_1 = 700
		SUELDO_BASICO_2 = 500

	PROGRAMA
		Para vc := 1 hasta 100 hacer
			ESCRIBIR("Indique la categoria a la que corresponde el chofer ", vc)
			LEER(categoria)
			ESCRIBIR("Indique si el chofer ", vc, " posee asistencia perfecta. (si/no)")
			LEER(asistencia)
			ESCRIBIR("Indique los años de antiguedad del chofer ", vc)
			LEER(antiguedad)

			Si categoria = 1 entonces
				Si asistencia = "si" entonces
					sueldo := SUELDO_BASICO_1 + (SUELDO_BASICO_1*0.02*antiguedad) + 200
					ESCRIBIR("El sueldo del chofer ", vc, " es de: $", sueldo)
				Sino
					sueldo := SUELDO_BASICO_1 + (SUELDO_BASICO_1*0.02*antiguedad)
					ESCRIBIR("El sueldo del chofer ", vc, " es de: $", sueldo)
				FinSi
			Sino
				Si asistencia = "si" entonces
					sueldo := SUELDO_BASICO_2 + (SUELDO_BASICO_2*0.02*antiguedad) + 200
					ESCRIBIR("El sueldo del chofer ", vc, " es de: $", sueldo)
				Sino
					sueldo := SUELDO_BASICO_2 + (SUELDO_BASICO_2*0.02*antiguedad)
					ESCRIBIR("El sueldo del chofer ", vc, " es de: $", sueldo)
				FinSi
			FinSi
		FinPara
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_31 ES
	AMBIENTE
		calidad: 1...2
		material: ("seda", "algodon")
		peso_m2: real
		longitud: real
		peso_total: real
		peso_pieza: real
		finalizar: ("si", "no")

		PESO_NUCLEO_1 = 400
		PESO_NUCLEO_2 = 300
		APRESTO_SEDA = 0.02
		APRESTO_ALGODON = 0.07

	PROCESO
		ESCRIBIR("Programa que calcula el peso total de una o varias piezas de tela")

		Repetir
			ESCRIBIR("Indique el material de la pieza: (seda/algodon)")
			LEER(material)
			ESCRIBIR("Indique si el material es de primera o segunda calidad: (1/2)")
			LEER(calidad)
			ESCRIBIR("Ingrese la longitud en metros de la pieza: ")
			LEER(longitud)
			ESCRIBIR("Ingrese el peso por m2 de tela: ")
			LEER(peso_m2)
			# Se supone que los rollos de tela tienen un ancho de 1m por lo que la longitud de la tela es igual en valor a la superficie total de la pieza

			peso_total := 0

			Si calidad=1 entonces
				Si material="seda" entonces
					peso_pieza := (peso_m2*longitud)*(1+APRESTO_SEDA) + PESO_NUCLEO_1
					peso_total := peso_total + peso_pieza
				Sino
					peso_pieza := (peso_m2*longitud)*(1+APRESTO_ALGODON) + PESO_NUCLEO_1
					peso_total := peso_total + peso_pieza
				FinSi
			Sino
				Si material="seda" entonces
					peso_pieza := (peso_m2*longitud)*(1+APRESTO_SEDA) + PESO_NUCLEO_2
					peso_total := peso_total + peso_pieza
				Sino
					peso_pieza := (peso_m2*longitud)*(1+APRESTO_ALGODON) + PESO_NUCLEO_2
					peso_total := peso_total + peso_pieza
				FinSi
			FinSi

			ESCRIBIR("¿Desea finalizar el programa? (si/no)")
			LEER(finalizar)

		Hasta que finalizar="si"
FIN_ACCION	

================================================================================================================

ACCION Ejercicio_1_1_32 ES
	AMBIENTE
		A: entero
		B: entero
		C: entero
		D: entero
		E: entero
		N: entero
		anio: 1990...2010

	PROCESO
		ESCRIBIR("Programa que devuelve que dia corresponde al domingo de Pascua de los años comprendidos entre 1990 y 2012")+

		Para anio := 1990 hasta 2010 hacer
			A := anio MOD 19
			B := anio MOD 4
			C := anio MOD 7
			D := (19*A + 24) MOD 30
			E := (2*B + 4*C + 6*D + 5) MOD 7
			N := 22 + D + E

			Si N>31 entonces
				N := N - 31
				ESCRIBIR("En el año ", anio, ", corresponde al domingo de Pascua el dia ", N, " de abril.")
			Sino
				ESCRIBIR("En el año ", anio, ", corresponde al domingo de Pascua el dia ", N, " de marzo.")
		FinPara
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_33 ES
	AMBIENTE
		N: entero
		vc: entero

	PROCESO
		ESCRIBIR("Ingrese un numero entero par")
		LEER(N)

		Mientras (N MOD 2) <> 0 hacer
			ESCRIBIR("ERROR! Por favor ingrese un numero entero par")
			LEER(N)
		FinMientras

		Para vc := 1 hasta N, 2 hacer
			Para vc := 1 hasta N, 2 hacer

FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_34 ES

FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_35 ES
	AMBIENTE
		







	






