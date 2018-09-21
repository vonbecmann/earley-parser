Class {
	#name : #JEAnalysisAEGrammarTest,
	#superclass : #TestCase,
	#instVars : [
		'grammar'
	],
	#category : #'EarleyAnalyzer-Tests'
}

{ #category : #initialization }
JEAnalysisAEGrammarTest >> setUp [
	grammar := JEExemplar AE
]

{ #category : #tests }
JEAnalysisAEGrammarTest >> testAnalizeAcceptsExpression [
	| stats chart |
	stats := grammar analyzeAccepts: 'a+a*a'.
	self assert: (stats at: 'accepts').
	self assert: (stats at: 'words size') equals: 5.
	chart := stats at: 'chart'.
	self assert: chart first size equals: 7.
	self assert: chart second size equals: 9.
	self assert: chart third size equals: 6.
	self assert: chart fourth size equals: 9.
	self assert: chart fifth size equals: 4.
	self assert: chart sixth size equals: 9
]

{ #category : #tests }
JEAnalysisAEGrammarTest >> testAnalizeParseExpression [
	| stats chart forest |
	stats := grammar analyzeParse: 'a+a*a'.
	self assert: (stats at: 'accepts').
	self assert: (stats at: 'words size') equals: 5.
	chart := stats at: 'chart'.
	self assert: chart first size equals: 7.
	self assert: chart second size equals: 10.
	self assert: chart third size equals: 7.
	self assert: chart fourth size equals: 10.
	self assert: chart fifth size equals: 5.
	self assert: chart sixth size equals: 10.
	forest := stats at: 'forest'.
	self assert: forest isNotNil.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
	
]
