tests
setUp
	recognizer := JERecognizer on: #(
	#(E #(T))
	#(E #(E + T))
	#(T #(P))
	#(T #(T * P))
	#(P #(a))
	)