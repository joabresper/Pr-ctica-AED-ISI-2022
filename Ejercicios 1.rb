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
			OTRO: ESCRIBIR("La suma de ", nro1, " y ", nro2,  "es mayor a 200.")
		FinSegun
FIN_ACCION

================================================================================

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

======================================================================

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
			ESCRIBIR("El dinero ahorrado es el necesario para realizar el viaje")
		Sino
			Si usd_necesarios < usd_ahorrados entonces
				diferencia := (usd_ahorrados - usd_necesarios)*ars_usd
				ESCRIBIR("El dinero ahorrado es suficiente para realizar el viaje y tiene un ahorro extra de ", diferencia, "pesos")
			Sino
				diferencia := (usd_necesarios - usd_ahorrados)*ars_usd
				ESCRIBIR("El dinero ahorrado no es suficiente para realizar el viaje, faltan ", diferencia, "pesos")
			FinSi
		FinSi
FIN_ACCION

===========================================================================

ACCION Ejercicio_1_1_12 ES
	AMBIENTE


Ejercicio_1_1_3

	"Una ACCION es un acontecimiento producido por un actor, que tiene lugar durante un período de tiempo FINITO y produce un RESULTADO bien determinado."
	"El instante de ... de la acción se denomina Ti y el instante de ... se denomina Tf."
	"El conjunto de los valores en el instante t dado del desarrollo del acontecimiento se denomina ... en el instante t."

============================================================================================

Ejercicio_1_1_4

	1 - "Conjunto de fenómenos organizados en el tiempo y concebido como activo" - "PROCESO"
	2 - "Descripción de un esquema de comportamiento" - "ALGORITMO"
	3 - "Algoritmo destinado a gobernar una máquina real" - "PROGRAMA"
	4 - "Mecanismo capaz de generar acciones que tienen lugar según un esquema determinado" - "MÁQUINA"

============================================================================================

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

============================================================================================

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

============================================================================================

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

============================================================================================

ACCION Ejercicio_1_1_5_4 ES
	AMBIENTE
		

