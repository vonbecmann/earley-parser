Class {
	#name : 'JEAnalysisBKGrammarTest',
	#superclass : 'TestCase',
	#instVars : [
		'grammar'
	],
	#category : 'EarleyAnalyzer-Tests',
	#package : 'EarleyAnalyzer',
	#tag : 'Tests'
}

{ #category : 'running' }
JEAnalysisBKGrammarTest >> setUp [

	super setUp.
	grammar := JEExemplar BK
]

{ #category : 'tests' }
JEAnalysisBKGrammarTest >> testAnalizeAccepts1X [
	| stats chart |
	stats := grammar analyzeAccepts: 'x'.
	self assert: (stats at: 'accepts').
	chart := stats at: 'chart'.
	self assert: chart first size equals: 10.
	self assert: chart second size equals: 13
]

{ #category : 'tests' }
JEAnalysisBKGrammarTest >> testAnalizeAccepts2X [

	| stats chart startColumnNumbers |
	stats := grammar analyzeAccepts: 'xx'.
	self assert: (stats at: 'accepts').
	chart := stats at: 'chart'.
	self assert: chart first size equals: 10.
	self assert: chart second size equals: 13.
	self assert: chart third size equals: 13.
	startColumnNumbers := stats
		                      at: 'chart stats'
		                      at: 'each column item start column number'.
	self
		assert: startColumnNumbers
		equals: #( #( 1 1 1 1 1 1 1 1 1 1 ) #( 1 1 1 1 1 1 1 1 2 2 2 2 2 )
			   #( 2 2 2 2 2 1 1 1 3 3 3 3 3 ) )
]

{ #category : 'tests' }
JEAnalysisBKGrammarTest >> testAnalizeAccepts3X [
	| stats chart |
	stats := grammar analyzeAccepts: 'xxx'.
	self assert: (stats at: 'accepts').
	chart := stats at: 'chart'.
	self assert: chart first size equals: 10.
	self assert: chart second size equals: 13.
	self assert: chart third size equals: 13.
	self assert: chart fourth size equals: 13
]

{ #category : 'tests' }
JEAnalysisBKGrammarTest >> testAnalizeAccepts4X [
	| stats chart |
	stats := grammar analyzeAccepts: 'xxxx'.
	self assert: (stats at: 'accepts').
	chart := stats at: 'chart'.
	self assert: chart first size equals: 10.
	self assert: chart second size equals: 13.
	self assert: chart third size equals: 13.
	self assert: chart fourth size equals: 13.
	self assert: chart fifth size equals: 13
]

{ #category : 'tests' }
JEAnalysisBKGrammarTest >> testAnalizeAcceptsEpsilon [
	| stats chart |
	stats := grammar analyzeAccepts: ''.
	self assert: (stats at: 'accepts').
	chart := stats at: 'chart'.
	self assert: chart first size equals: 10
]
