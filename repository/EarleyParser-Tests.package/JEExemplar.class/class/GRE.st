instance creation
GRE
	^ JEGrammar
		productionRules:
			#(	#('X' #('letter a symbol')) 
				#('X' #('X' 'letter b symbol')) 
				#('X' #('Y' 'letter a symbol')) 
				#('Y' #('letter e symbol')) 
				#('Y' #('Y' 'letter d symbol' 'Y')))
		representations:
			{('letter a symbol' -> (JETerminal character: $a)).
			('letter b symbol' -> (JETerminal character: $b)).
			('letter e symbol' -> (JETerminal character: $e)).
			('letter d symbol' -> (JETerminal character: $d))}