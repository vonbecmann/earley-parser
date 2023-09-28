Class {
	#name : #JEGREGrammarForestTest,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEGREGrammarForestTest >> setUp [
	super setUp.
	grammar := JEExemplar GRE
]

{ #category : #tests }
JEGREGrammarForestTest >> testParse_ededeab10 [
	"ededeab^10"

	forest := grammar parse: 'ededeabbbbbbbbbb'.

	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2
]
