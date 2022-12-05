ACCION Ejer_3_1a ES
	AMBIENTE
		N = 100
		A: Arreglo [1..N] de entero
		x, i: entero

	PROCESO
		Para i := 1 hasta N hacer
			ESCRIBIR("Ingrese el valor del elemento ", i)
			LEER(x)
			A[i] := x
		FinPara
FIN_ACCION

================================================================================================================

ACCION Ejer_3_1b ES
	AMBIENTE
		menor, posi_men, mayor, posi_may, i: entero
		N = 100
		A: Arreglo [1..N] de entero

	PROCESO
		menor := HV
		mayor := LV

		Para i := 1 hasta N hacer
			Si A[i] < menor entonces
				menor := A[i]
				posi_men := i
			FinSi

			Si A[i] > mayor entonces
				mayor := A[i]
				posi_may := I
			FinSi
		FinPara

		ESCRIBIR("El mayor valor es: ", mayor, ", y su posicion: ", posi_may)
		ESCRIBIR("El menor valor es: ", menor, ", y su posicion: ", posi_men)
FIN_ACCION

================================================================================================================

ACCION Ejer_3_1c ES
	AMBIENTE
		cant_pares, suma_pares, i: entero
		N = 100
		A: Arreglo [1..N] de entero

	PROCESO
		cant_pares := 0
		suma_pares := 0

		Para i := 1 hasta N hacer
			Si (A[i] MOD 2) = 0 entonces
				cant_pares := cant_pares + 1
				suma_pares := suma_pares + A[i]
			FinSi
		FinPara

		ESCRIBIR("Cantidad de numeros pares: ", cant_pares)
		ESCRIBIR("Suma de todos los numeros pares: ", suma_pares)
FIN_ACCION

================================================================================================================

ACCION Ejer_3_2 ES
	AMBIENTE
		N = 100
		A: Arreglo [1..N] de entero
		elem, mayor, menor, posi_may, posi_men, cant_pares, suma_pares, i: entero

	PROCESO
		cant_pares := 0
		suma_pares := 0
		mayor := LV
		menor := HV

		Para i := 1 hasta N hacer
			//Primer parte
			ESCRIBIR("Ingrese el valor del elemento ", i)
			LEER(elem)
			A[i] := elem

			//Segunda parte
			Si A[i] < menor entonces
				menor := A[i]
				posi_men := i
			FinSi

			Si A[i] > mayor entonces
				mayor := A[i]
				posi_may := i
			FinSi

			//Tercer parte
			Si (A[i] MOD 2) = 0 entonces
				cant_pares := cant_pares + 1
				suma_pares := suma_pares + A[i]
			FinSi

			//Emision de resultados
			ESCRIBIR("Mayor numero: ", mayor, ", posicion: ", posi_may)
			ESCRIBIR("Menor numero: ", menor, ", posicion: ", posi_men)
			ESCRIBIR("Cantidad de pares: ", cant_pares)
			ESCRIBIR("Suma de todos los pares: ", suma_pares)
FIN_ACCION

================================================================================================================

ACCION Ejer_3_3 ES
	AMBIENTE
		N = 100
		x, y: real
		i: entero
		A: Arreglo [0..N] de real

	PROCESO
		y := 0
		ESCRIBIR("Ingrese el valor de x")
		LEER(x)

		Para i := 0 hasta N hacer
			y := y + A[i]*(x**i)
		FinPara

		ESCRIBIR("El valor final de y es: ", y)
FIN_ACCION

================================================================================================================

ACCION Ejer_3_4 ES
	AMBIENTE
		N = 50

		A: Arreglo [1..N] de entero
		B: Arreglo [1..N] de entero
		
		cumplieron, modif, i: entero

	PROCESO
		cumplieron := 0
		posicion := 1

		Para i := 1 hasta N hacer
			B[i] := 0
		FinPara

		Para i := 1 hasta N hacer
			Si (A[i] MOD 3) = 0 entonces
				cumplieron := cumplieron + 1
			Sino
				B[posicion] := A[i]
				ESCRIBIR("El valor de la posicion ", i, "no es multiplo de 3")
				ESCRIBIR("Ingrese un entero multiplo de 3 para modificarlo: ")
				LER(modif)
				
				Mientras (modif MOD 3) <> 0 hacer
					ESCRIBIR("El numero ingresado no es multiplo de 3. Intente nuevamente: ")
					LEER(modif)
				FinMientras

				A[i] := modif
				posicion := posicion + 1
			FinSi
		FinPara
FIN_ACCION

================================================================================================================

ACCION Ejer_3_5 ES
	AMBIENTE
		N = 30
		A, B: Arreglo [1..N] de real
		C: Arreglo [1..(N*2)] de real
		i, j, k: entero

	PROCESO
		i := 1; j := 1; k := 1

		Mientras (j <= 30) y (k <= 30) hacer
			Si A[j] <= B[k] entonces
				C[i] := A[j]
				j := j + 1
			Sino
				C[i] := B[k]
				k := k + 1
			FinSi
			 i := i + 1
		FinMientras

		Mientras j <= 30 hacer
			C[i] := A[j]
			j := j + 1
			i := i + 1
		FinMientras

		Mientras k <= 30 hacer
			C[i] := B[k]
			k := k + 1
			i := i + 1
		FinMientras
FIN_ACCION

================================================================================================================

ACCION Ejer_3_6 ES
	AMBIENTE
		Nombres: Arreglo [1..N] de AN(10)

	PROCESO
		Para i := 1 hasta N hacer
			ESCRIBIR("Ingrese un nombre para la posicion ", i, "del arreglo: ")
			LEER(Nombre[i])
		FinPara
FIN_ACCION

================================================================================================================

ACCION Ejer_3_7a ES
	AMBIENTE
		Nombres: Arreglo [1..N] de AN(10)
		i, izq, der, medio: entero
		buscar: AN(10)

	PROCESO
		Cargar_arreglo()
		ESCRIBIR("Ingrese el nombre que desea buscar: ")
		LEER(buscar)

		izq := 1; der := N
		medio := (izq + der) DIV 2

		Mientras (izq < der) y (buscar <> Nombres[medio]) hacer
			Si buscar < Nombres[medio] entonces
				der := medio - 1
			Sino
				izq := medio + 1
			FinSi

			medio := (izq + der) DIV 2
		FinMientras

		Si buscar = Nombres[medio] entonces
			ESCRIBIR("El nombre ", buscar, " se encuentra en la posicion ", medio)
		Sino
			ESCRIBIR("No se encontro el nombre ", buscar, " en el arreglo")
		FinSi
FIN_ACCION

================================================================================================================

ACCION Ejer_3_7b ES
	AMBIENTE
		Nombres: Arreglo [1..N] de AN(10)
		buscar: AN(10)
		cent: entero

	PROCESO
		Cargar_arreglo()
		ESCRIBIR("Ingrese el nombre que desea buscar: ")
		LEER(buscar)

		cent := 1

		Mientras (cent < N) y (buscar < Nombres[cent]) hacer
			cent := cent + 1
		FinMientras

		Si buscar = Nombres[cent] entonces
			ESCRIBIR("El nombre ", buscar, " se encuentra en la posicion ", cent)
		Sino
			ESCRIBIR("No se encontro el nombre ", buscar, " en el arreglo")
		FinSi
FIN_ACCION

================================================================================================================

ACCION Ejer_3_8 ES
	AMBIENTE
		Nombres: Arreglo [1..N] de AN(10)
		i: entero
		letra: caracter

	PROCESO
		Cargar_arreglo()
		ESCRIBIR("Ingrese una letra para buscar nombres que comiensen con esta: ")
		LEER(letra)

		Para i := 1 hasta N hacer
			Si Nombres[i] = caracter entonces
				ESCRIBIR("Nombre encontrado en posicion ", i)
			FinSi
		FinPara
FIN_ACCION

================================================================================================================

ACCION Ejer_3_9 ES
	AMBIENTE
		

	PROCESO
		
FIN_ACCION

================================================================================================================

ACCION Ejer_3_10 ES
	AMBIENTE
		
	PROCESO
		
FIN_ACCION

================================================================================================================

ACCION Ejer_3_11 ES
	AMBIENTE
		Pelicula = Registro
			titulo: AN(20)
			director: AN(30)
			categoria: AN(15)
			vistas: entero
			alquilada: ("si", "no")
		FinRegistro

		N = 100
		A: Arreglo [1..N] de Pelicula

		cat: AN(15)
		i: entero

	PROCESO
		Cargar_arreglo()
		ESCRIBIR("Ingrese una categoria para buscar peliculas")
		LEER(cat)

		Para i := 1 hasta N hacer
			Si A[i].categoria = cat entonces
				ESCRIBIR("Titulo: ", A[i].titulo)
				ESCRIBIR("Director: ", A[i].director)
				ESCRIBIR("Personas que la vieron: ", A[i].vistas)
				ESCRIBIR("Alquilada: ", A[i].alquilada)
			FinSi
		FinPara
FIN_ACCION

================================================================================================================

ACCION Ejer_3_12 ES
	AMBIENTE
		Pelicula = Registro
			titulo: AN(20)
			director: AN(30)
			categoria: AN(15)
			vistas: entero
			alquilada: ("si", "no")
		FinRegistro

		N = 100
		A: Arreglo [1..N] de Pelicula

		operacion: 1..3
		tit: AN(20)
		posicion, i: entero

	PROCESO
		Cargar_arreglo()
		ESCRIBIR("Elija la operacion que desea realizar: ", "[1] Alquiler", "[2] Devolucion", "[3] Salir")
		LEER(operacion)

		Mientras operacion <> 3 hacer
			Si operacion = 1 entonces
				ESCRIBIR("Ingrese el titulo de la pelicula que desea alguilar")
				LEER(tit)

				Para i := 1 hasta N hacer
					Si A[i].titulo = tit entonces
						posicion := i
					FinSi
				FinPara

				Si A[posicion].alguilada = "no" entonces
					ESCRIBIR("Pedido de algquiler exitoso")
					A[posicion].alquilada := "si"
				Sino
					ESCRIBIR("Pelicula ya alquilada. Pedido imposible")
				FinSi

				ESCRIBIR("Desea realizar otra operacion? ", "[1] Alquiler", "[2] Devolucion", "[3] Salir")
				LEER(operacion)
			Sino
				ESCRIBIR("Ingrese el titulo de la pelicula que desea devolver")
				LEER(tit)

				Para i := 1 hasta N hacer
					Si A[i].titulo = tit entonces
						posicion := i
					FinSi
				FinPara

				Si A[posicion].alquilada = "si" entonces
					A[posicion].alquilada := "no"
					A[posicion].vistas := A[posicion].vistas + 1
					ESCRIBIR("Devolucion exitosa")
				Sino
					ESCRIBIR("Pelicula no alquilada. Controle haber ingresado el titulo correcto")
				FinSi
			FinSi
		FinMientras
FIN_ACCION

================================================================================================================

ACCION Ejer_3_13_SelecDirec ES
	AMBIENTE
		Alumno = Registro
			legajo: N(5)
			cant_materias: entero
		FinRegistro

		A: Arreglo [1..N] de Alumno
		i, j, minimo: entero
		aux: Alumno

	PROCESO
		Cargar_arreglo()

		Para i := 1 hasta (N-1) hacer
			minimo := i
			aux := A[i]

			Para j := (i+1) hasta N hacer
				Si A[j].cant_materias < aux.cant_materias entonces
					minimo := j
					aux := A[j]
				FinSi
			FinPara

			A[minimo] := A[i]
			A[i] := aux
		FinPara
FIN_ACCION

================================================================================================================

ACCION Ejer_3_13_InsercDirect ES
	AMBIENTE
		Alumno = Registro
			legajo: N(5)
			cant_materias: entero
		FinRegistro

		A: Arreglo [1..N] de Alumno
		i, j, minimo: entero
		aux: Alumno

	PROCESO
		Cargar_arreglo()

		Para i := 2 hasta N hacer
			aux := A[i]
			j := i-1

			Mientras (j > 0) y (aux.cant_materias < A[j].cant_materias) hacer
				A[j+1] := A[j]
				j := j-1
			FinMientras

			A[j+1] := aux
		FinPara			
FIN_ACCION

================================================================================================================

ACCION Ejer_3_13_Burbuja ES
	AMBIENTE
		Alumno = Registro
			legajo: N(5)
			cant_materias: entero
		FinRegistro

		A: Arreglo [1..N] de Alumno
		i, j, minimo: entero
		aux: Alumno
		bandera: logico

	PROCESO
		Cargar_arreglo()
		bandera := Falso

		Mientras no bandera hacer
			bandera := Verdadero

			Para i := 1 hasta (N-1) hacer
				Si A[i].cant_materias > A[i+1].cant_materias entonces
					aux := A[i]
					A[i] := A[i+1]
					A[i+1] := aux

					bandera := Falso
				FinSi
			FinPara
		FinMientras
FIN_ACCION

================================================================================================================

ACCION Ejer_3_25 ES
	AMBIENTE
		Fecha = Registro
			anio: N(4)
			mes: 1..12
			dia: 1..31
		FinRegistro

		Compra = Registro
			nro_factura: entero
			proveedor: ("A", "B", "C")
			fecha: Fecha
			nro_planta: 1..4
			importe: real
		FinRegistro

		Acompras: Archivo de Compra
		Reg: Compra

		Arr: Arreglo [1..4, "A".."D", 1..13] de real

		i, j, k: entero

		PROCEDIMIENTO Inicializar_arreglo() ES
			Para i := 1 hasta 4 hacer
				Para j := "A" hasta "D" hacer
					Para k := 1 hasta 13 hacer
						Arr[i, j, k] := 0
					FinPara
				FinPara
			FinPara
		FIN_PROCEDIMIENTO
		
	PROCESO
		ABRIR E/ (Acompras); LEER(Acompras)
		Inicializar_arreglo()

		Mientras NFDA(Acompras) hacer
			i := Reg.nro_planta
			j := Reg.proveedor
			k := Reg.fecha.mes

			A[i, j, k] := A[i, j, k] + Reg.importe
			A[i, "D", k] := A[i, "D", k] + Reg.importe
			A[i, j, 13] := A[i, j, 13] + Reg.importe
			A[i, "D", 13] := A[i, "D", 13] + Reg.importe

			LEER(Acompras)
		FinMientras
		
		CERRAR(Acompras)
FIN_ACCION

================================================================================================================

ACCION Ejer_3_28 ES
	AMBIENTE
		Terreno = Registro
			nro: entero
			zona: "A".."F"
			ubicacion: 1..10
			superficie: real
		FinRegistro

		Aen: Archivo de Terreno
		Ren: Terreno

		Valores_zona: Arreglo ["A".."F"] de real
		Arr_sal: Arreglo ["A".."G", 1..11] de real

		z, u: entero
		valor_terreno, coef: real

	PROCESO
		ABRIR E/ (Aen); LEER(Aen, Ren)
		Cargar_arreglo_zonas()
		Inicializar_arreglo_sal()

		Mientras NFDA(Aen) hacer
			z := Ren.zona
			u := Ren.ubicacion
			valor_terreno := Ren.superficie * Valores_zona[z] * coef

			Arr[z, u] := Arr[z, u] + valor_terreno
			Arr["G", u] := Arr["G", u] + valor_terreno
			Arr[z, 11] := Arr[z, 11] + valor_terreno
			Arr["G", 11] := Arr["G", 11] + valor_terreno

			LEER(Aen, Ren)
		FinMientras
FIN_ACCION

================================================================================================================

ACCION Ejer_3_29 ES
	AMBIENTE
		Mascota = Registro
			tipo_doc: N(1)
			nro_doc: N(8)
			nom_mascota: AN(30)
			direccion: AN(40)
		FinRegistro

		Aen: Archivo de Mascota
		Ren: Mascota
		Sec: Secuencia de caracter
		Car: caracter

		doc: AN(3)
		nombre_mascota: AN(30)
		direcc: AN(40) 

	PROCESO

		
FIN_ACCION

================================================================================================================

