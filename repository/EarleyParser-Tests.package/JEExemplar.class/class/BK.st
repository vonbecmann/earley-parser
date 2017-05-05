instance creation
BK
	"has unbounded ambiguity, yet it is a time n grammar. page 39.
	Tomita's An Efficient Context-free Parsing Algorithm For Natural Languages. 
	page 762. figure 23: Grammar G1."

	^ JEGrammar
		productionRules:
			#(	#('K' #()) 
				#('K' #('K' 'J')) 
				#('J' #('F')) 
				#('J' #('I')) 
				#('F' #('letter x symbol')) 
				#('I' #('letter x symbol')))
		representations: {('letter x symbol' -> (JETerminal character: $x))}