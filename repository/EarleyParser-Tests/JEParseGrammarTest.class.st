"
parse a grammar test
"
Class {
	#name : #JEParseGrammarTest,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'forest'
	],
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #testing }
JEParseGrammarTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self name = #JEParseGrammarTest
]

{ #category : #running }
JEParseGrammarTest >> setUp [
	super setUp.
	grammar := forest := nil
]

{ #category : #running }
JEParseGrammarTest >> tearDown [
	grammar := forest := nil.
	super tearDown
]
