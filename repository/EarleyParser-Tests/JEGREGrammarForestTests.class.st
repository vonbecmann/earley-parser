Class {
	#name : #JEGREGrammarForestTests,
	#superclass : #TestCase,
	#instVars : [
		'grammar'
	],
	#category : 'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEGREGrammarForestTests >> setUp [
	grammar := JEExemplar GRE
]

{ #category : #tests }
JEGREGrammarForestTests >> testParse_ededeab10 [
	"ededeab^10"

	| forest |
	forest := grammar parse: 'ededeabbbbbbbbbb'.

	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2.
	
]
