Class {
	#name : #JEAnalysisBKGrammarTest,
	#superclass : #TestCase,
	#instVars : [
		'grammar'
	],
	#category : #'EarleyAnalyzer-Tests'
}

{ #category : #initialization }
JEAnalysisBKGrammarTest >> setUp [
	grammar := JEExemplar BK
]

{ #category : #tests }
JEAnalysisBKGrammarTest >> testAnalizeAccepts1X [
	| stats chart |
	stats := grammar analyzeAccepts: 'x'.
	self assert: (stats at: 'accepts').
	chart := stats at: 'chart'.
	self assert: chart first size equals: 10.
	self assert: chart second size equals: 13
]

{ #category : #tests }
JEAnalysisBKGrammarTest >> testAnalizeAccepts2X [
	| stats chart |
	stats := grammar analyzeAccepts: 'xx'.
	self assert: (stats at: 'accepts').
	chart := stats at: 'chart'.
	self assert: chart first size equals: 10.
	self assert: chart second size equals: 13.
	self assert: chart third size equals: 13
]

{ #category : #tests }
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

{ #category : #tests }
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

{ #category : #tests }
JEAnalysisBKGrammarTest >> testAnalizeAcceptsEpsilon [
	| stats chart |
	stats := grammar analyzeAccepts: ''.
	self assert: (stats at: 'accepts').
	chart := stats at: 'chart'.
	self assert: chart first size equals: 10
]
