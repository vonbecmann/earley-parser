"
Shared Packed Parse Forest Style From Early Recognisers.
Elizabeth Scott


"
Class {
	#name : #JESPPFGrammarTest,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #tests }
JESPPFGrammarTest >> testExample2 [

	grammar := JEGrammar
		productionRules:
			#(	#('S' #('S' 'S'))
				#('S' #('letter b symbol')))
		representations:
			{('letter b symbol' -> (NCTerminal character: $b))}.

	self assert: (grammar accepts: 'bbb').
	forest := grammar parse: 'bbb'.
	self assert: forest isAmbiguous
]
