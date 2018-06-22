Class {
	#name : #JEGREGrammarForestTests,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEGREGrammarForestTests >> setUp [
	super setUp.
	grammar := JEExemplar GRE
]

{ #category : #tests }
JEGREGrammarForestTests >> testParse_ededeab10 [
	"ededeab^10"

	forest := grammar parse: 'ededeabbbbbbbbbb'.

	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2.
	
]
