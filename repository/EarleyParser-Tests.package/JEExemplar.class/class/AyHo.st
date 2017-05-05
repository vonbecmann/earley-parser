instance creation
AyHo
	"
	Practical Earley Parsing
	John Aycock
	R. Nigel Horspool
	page 2, figure 2
	"

	^ JEGrammar
		productionRules:
			#(	#('S' #('A' 'A' 'A' 'A')) 
				#('A' #('E')) 
				#('A' #('letter a symbol')) 
				#('E' #()))
		representations: {('letter a symbol' -> (JETerminal character: $a))}