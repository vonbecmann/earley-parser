Class {
	#name : #JEAyHoGrammarParseTests,
	#superclass : #JEParseGrammarTest,
	#instVars : [
		'grammar',
		'forest'
	],
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEAyHoGrammarParseTests >> setUp [
	grammar := JEExemplar AyHo.
	forest := nil
]

{ #category : #tests }
JEAyHoGrammarParseTests >> testParse1A [
	forest := grammar parse: 'a'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4
]

{ #category : #tests }
JEAyHoGrammarParseTests >> testParse2A [
	forest := grammar parse: 'aa'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 6
]

{ #category : #tests }
JEAyHoGrammarParseTests >> testParse3A [
	forest := grammar parse: 'aaa'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4
]

{ #category : #tests }
JEAyHoGrammarParseTests >> testParse4A [
	forest := grammar parse: 'aaaa'.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAyHoGrammarParseTests >> testParseEpsilon [
	forest := grammar parse: ''.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]
