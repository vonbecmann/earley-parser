"
recognize a grammar test.

"
Class {
	#name : #JERecognizeGrammarTest,
	#superclass : #TestCase,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #testing }
JERecognizeGrammarTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self name = #JERecognizeGrammarTest
]
