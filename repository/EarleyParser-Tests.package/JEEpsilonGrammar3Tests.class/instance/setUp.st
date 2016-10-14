running
setUp
	grammar := JEGrammar
		productionRules: 
			#(	#(E #(E Q F)) 
				#(E #(F)) 
				#(Q #()))
		representations:
			{	('F' -> (JETerminal character: $a)).
				('Q' -> (JETerminal character: $*)).
				('Q' -> (JETerminal character: $/))}