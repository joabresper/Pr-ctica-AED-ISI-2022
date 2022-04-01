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
        pie_metro: real
        altura_edificio: real

    PROCESO
        ESCRIBIR("Calcule la altura de un edificio en pies")
        ESCRIBIR("Ingrese la cantidad de pisos del edificio")
        LEER(cantidad_pisos)
        ESCRIBIR("Ingrese la altura promedio de cada piso en metros")
        LEER(altura_piso_metros)
        pie_metro := 3.28

        
        Para cantidad_pisos hasta 1, -1 hacer
            altura_edificio := altura_edificio + altura_piso_metros*pie_metro
        FinPara

        ESCRIBIR("La altura promedio del edificio de ", cantidad_pisos, " pisos es ", altura_edificio, " pies.")
FIN_ACCION

================================================================================================================

ACCION Ejercicio_1_1_16 ES




