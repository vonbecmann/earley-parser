instance creation
PAL
	"pallindrome grammar. page 65"

	^ JEGrammar
		productionRules:
			#(	#('A' #('letter x symbol')) 
				#('A' #('letter x symbol' 'A' 'letter x symbol')))
		representations: {('letter x symbol' -> (JETerminal character: $x))}