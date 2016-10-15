running
setUp
	grammar := 
		JEGrammar
			productionRules: 
				#(	#(S #(A B A B))
			  		#(A #(E))
			  		#(B #(E))
			  		#(E #()))
			representations: {('A' -> (JETerminal character: $a))}.