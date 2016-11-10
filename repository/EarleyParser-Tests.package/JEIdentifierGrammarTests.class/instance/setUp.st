running
setUp
	grammar := JEGrammar
		productionRules:
			#(	#('identifier' #('letter symbol' 'word symbol star')) 
				#('word symbol star' #('word symbol' 'word symbol star')) 
				#('word symbol star' #()))
		representations:
			{('letter symbol' -> (JETerminal rxCharSet: '[a-zA-Z]')).
			('word symbol' -> (JETerminal rxCharSet: '[\w]'))}