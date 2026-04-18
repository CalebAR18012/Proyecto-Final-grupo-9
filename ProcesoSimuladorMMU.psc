Algoritmo ProcesoSimuladorMMU
		
		// -------------------------
		// VARIABLES
		// -------------------------
		Dimension Referencias[12]
		Dimension Marcos[3]
		Dimension Ocupado[3]
		
		Definir i, t, pag, libre, puntero Como Entero
		Definir fallosFIFO, fallosOPT Como Entero
		Definir encontrado, encontradoFuturo Como Logico
		Definir k, distancia, mayor, victima Como Entero
		
		// -------------------------
		// INICIALIZACIÓN
		// -------------------------
		fallosFIFO = 0
		fallosOPT = 0
		puntero = 1
		
		// -------------------------
		// CARGAR REFERENCIAS
		// -------------------------
		Referencias[1] = 1
		Referencias[2] = 2
		Referencias[3] = 3
		Referencias[4] = 4
		Referencias[5] = 1
		Referencias[6] = 2
		Referencias[7] = 5
		Referencias[8] = 1
		Referencias[9] = 2
		Referencias[10] = 3
		Referencias[11] = 4
		Referencias[12] = 5
		
		// =========================
		// ?? FIFO
		// =========================
		
		// Inicializar marcos
		Para i = 1 Hasta 3
			Marcos[i] = -1
			Ocupado[i] = 0
		FinPara
		
		Para t = 1 Hasta 12
			pag = Referencias[t]
			encontrado = Falso
			
			// Buscar página
			Para i = 1 Hasta 3
				Si Ocupado[i] = 1 Y Marcos[i] = pag Entonces
					encontrado = Verdadero
				FinSi
			FinPara
			
			Si encontrado = Falso Entonces
				fallosFIFO = fallosFIFO + 1
				
				libre = -1
				Para i = 1 Hasta 3
					Si Ocupado[i] = 0 Entonces
						libre = i
					FinSi
				FinPara
				
				Si libre <> -1 Entonces
					Ocupado[libre] = 1
					Marcos[libre] = pag
				Sino
					Marcos[puntero] = pag
					puntero = puntero + 1
					Si puntero > 3 Entonces
						puntero = 1
					FinSi
				FinSi
			FinSi
		FinPara
		
		// =========================
		// ?? OPT
		// =========================
		
		// Reiniciar marcos
		Para i = 1 Hasta 3
			Marcos[i] = -1
			Ocupado[i] = 0
		FinPara
		
		Para t = 1 Hasta 12
			pag = Referencias[t]
			encontrado = Falso
			
			// Buscar página
			Para i = 1 Hasta 3
				Si Ocupado[i] = 1 Y Marcos[i] = pag Entonces
					encontrado = Verdadero
				FinSi
			FinPara
			
			Si encontrado = Falso Entonces
				fallosOPT = fallosOPT + 1
				
				libre = -1
				Para i = 1 Hasta 3
					Si Ocupado[i] = 0 Entonces
						libre = i
					FinSi
				FinPara
				
				Si libre <> -1 Entonces
					Ocupado[libre] = 1
					Marcos[libre] = pag
				Sino
					mayor = -1
					victima = 1
					
					Para i = 1 Hasta 3
						distancia = 999
						encontradoFuturo = Falso
						
						Para k = t+1 Hasta 12
							Si Referencias[k] = Marcos[i] Y encontradoFuturo = Falso Entonces
								distancia = k - t
								encontradoFuturo = Verdadero
							FinSi
						FinPara
						
						Si distancia > mayor Entonces
							mayor = distancia
							victima = i
						FinSi
					FinPara
					
					Marcos[victima] = pag
				FinSi
			FinSi
		FinPara
		
		// -------------------------
		// RESULTADOS
		// -------------------------
		Escribir "=============================="
		Escribir "RESULTADOS"
		Escribir "Fallos FIFO: ", fallosFIFO
		Escribir "Fallos OPT: ", fallosOPT
		Escribir "=============================="
		
		Esperar Tecla
		
FinProceso