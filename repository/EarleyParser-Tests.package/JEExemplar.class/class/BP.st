instance creation
BP
	"has unbounded direct ambiguity, it's time is n ^ 2. page 40."

	^ JEGrammar
		productionRules:
			#(	#('P' #('M' 'N')) 
				#('M' #()) 
				#('M' #('M' 'letter a symbol')) 
				#('N' #()) 
				#('N' #('N' 'letter a symbol')))
		representations: {('letter a symbol' -> (JETerminal character: $a))}