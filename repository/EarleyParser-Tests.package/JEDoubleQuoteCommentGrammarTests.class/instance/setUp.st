running
setUp
	grammar := JEGrammar
		productionRules:
#(	#('comment' 
		#('double quote mark symbol' '(not double quote) star' 'double quote mark symbol')) 
	#('(not double quote) star' #('not double quote mark symbol' '(not double quote) star')) 
	#('(not double quote) star' #()))
		representations:
			{('double quote mark symbol' -> (JETerminal character: $")).
			('not double quote mark symbol' -> (JETerminal charSetComplement: '"'))}