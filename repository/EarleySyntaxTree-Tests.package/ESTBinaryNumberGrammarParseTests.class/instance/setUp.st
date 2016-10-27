running
setUp
	tree := nil.
	grammar := JEGrammar
		productionRules:
			#(	#('binary number' #('bit sequence')) 
				#('bit sequence' #('bit')) 
				#('bit sequence' #('bit sequence' 'bit')) 
				#('bit' #('one symbol')) 
				#('bit' #('zero symbol')))
		representations:
			{('one symbol' -> (JETerminal character: $1)).
			('zero symbol' -> (JETerminal character: $0))}