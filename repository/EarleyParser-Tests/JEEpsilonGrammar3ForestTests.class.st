Class {
	#name : #JEEpsilonGrammar3ForestTests,
	#superclass : #TestCase,
	#instVars : [
		'grammar'
	],
	#category : 'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEEpsilonGrammar3ForestTests >> setUp [
	grammar := JEGrammar
		productionRules: 
			#(	#(E #(E Q F)) 
				#(E #(F)) 
				#(Q #()))
		representations:
			{	('F' -> (NCTerminal character: $a)).
				('Q' -> (NCTerminal character: $*)).
				('Q' -> (NCTerminal character: $/))}
]

{ #category : #tests }
JEEpsilonGrammar3ForestTests >> testParse02 [
	| forest |
	forest := grammar parse: 'aa/a'.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]
