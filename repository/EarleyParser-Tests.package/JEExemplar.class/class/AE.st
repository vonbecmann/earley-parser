instance creation
AE
	"Arithmetic Expressions. page 15"

	^ JEGrammar
		productionRules:
			#(#('E' #('T')) 
			  #('E' #('E' 'plus symbol' 'T')) 
			  #('T' #('P')) 
			  #('T' #('T' 'star symbol' 'P')) 
			  #('P' #('letter a symbol')))
		representations:
			{('plus symbol' -> (JETerminal character: $+)).
			('star symbol' -> (JETerminal character: $*)).
			('letter a symbol' -> (JETerminal character: $a))}