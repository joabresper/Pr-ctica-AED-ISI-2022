ACCION Control_enies ES
	#Como la letra enie no existe en el teclado ingles, no aparece en ninguna parte del codigo, y fue reemplazada por la palabra 'enie' para hacer referencia a dicha letra.
	AMBIENTE
		sec: secuencia de caracter
		v: caracter
		ABC = ("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
		enie_en_oraciones: entero
		enie_en_parrafos: entero
		enie_en_hojas: entero
		enie_en_capitulos: entero
		enie_en_texto: entero
		cant_palabras_en_oracion: entero

		oracion_nro: entero
		parrafo_nro: entero
		hoja_nro: entero
		capitulo_nro: entero

	PROCESO
		ARRANCAR(sec)
		AVANZAR(sec, v)

		enie_en_oraciones := 0
		enie_en_parrafos := 0
		enie_en_hojas := 0
		enie_en_capitulos := 0
		enie_en_texto := 0
		cant_palabras_en_oracion := 0

		oracion_nro := 1
		parrafo_nro := 1
		hoja_nro := 1
		capitulo_nro := 1

		#Tratado del texto
		Mientras v<>"!" hacer
			#Tratado de capitulos
			Mientras v<>"!" y v<>"$" hacer
				#Tratado de hojas
				Mientras v<>"$" y v<>"&" hacer
					#Tratado de parrafos
					Mientras v<>"&" y v<>"#" hacer
						#Tratado de oraciones
						Mientras v<>"#" y v<>"." hacer
							#Tratado de blancos
							Mientras v<>"." y v=" " hacer
								AVANZAR(sec, v)
							FinMientras
							#Tratado de palabras
							Mientras v<>" " y v<>"." hacer
								Si v no en ABC entonces
									enie_en_oraciones := enie_en_oraciones + 1
								FinSi
								AVANZAR(sec, v)
							FinMientras
							cant_palabras_en_oracion := cant_palabras_en_oracion + 1
						FinMientras

						ESCRIBIR("La cantidad de enies presentes en la oracion ", oracion_nro, " es de ", enie_en_oraciones)
						ESCRIBIR("La cantidad de palabras con contenido en la oracion ", oracion_nro, " es de ", cant_palabras_en_oracion)
						oracion_nro := oracion_nro + 1
						enie_en_parrafos := enie_en_parrafos + enie_en_oraciones
						enie_en_oraciones := 0
						cant_palabras_en_oracion := 0
						
						AVANZAR(sec, v)
					FinMientras

					ESCRIBIR("La cantidad de enies presentes en el parrafo ", parrafo_nro, " es de ", enie_en_parrafos)
					parrafo_nro := parrafo_nro + 1
					enie_en_hojas := enie_en_hojas + enie_en_parrafos
					enie_en_parrafos := 0
					
					AVANZAR(sec, v)
				FinMientras

				ESCRIBIR("La cantidad de enies presentes en la hoja ", hoja_nro, " es de ", enie_en_hojas)
				hoja_nro := hoja_nro + 1
				enie_en_capitulos := enie_en_capitulos + enie_en_hojas
				enie_en_hojas := 0

				AVANZAR(sec, v)
			FinMientras

			ESCRIBIR("La cantidad de enies presentes en el capitulo ", capitulo_nro, " es de ", enie_en_capitulos)
			capitulo_nro := capitulo_nro + 1
			enie_en_texto := enie_en_texto + enie_en_capitulos
			enie_en_capitulos := 0

			AVANZAR(sec, v)
		FinMientras

		ESCRIBIR("La cantidad de enies presentes en el texto es de ", enie_en_texto)
FIN_ACCION


