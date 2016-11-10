tests
testExample2
	| forest |
	grammar := JEGrammar
		productionRules: 
			#(	#('S' #('S' 'S')) 
				#('S' #('letter b symbol')))
		representations: 
			{('letter b symbol' -> (JETerminal character: $b))}.
	self assert: (grammar accepts: 'bbb').
	forest := grammar parseForest: 'bbb'.
	self assert: forest isAmbiguous