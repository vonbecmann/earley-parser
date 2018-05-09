"
Shared Packed Parse Forest Style From Early Recognisers.
Elizabeth Scott


"
Class {
	#name : #JESPPFGrammarTests,
	#superclass : #TestCase,
	#instVars : [
		'grammar'
	],
	#category : 'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JESPPFGrammarTests >> setUp [
	grammar := nil
]

{ #category : #tests }
JESPPFGrammarTests >> testExample2 [
	| forest |
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
