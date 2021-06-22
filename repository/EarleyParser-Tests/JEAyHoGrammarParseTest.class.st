Class {
	#name : #JEAyHoGrammarParseTest,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEAyHoGrammarParseTest >> setUp [
	super setUp.
	grammar := JEExemplar AyHo
]

{ #category : #tests }
JEAyHoGrammarParseTest >> testParse1A [
	forest := grammar parse: 'a'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4
]

{ #category : #tests }
JEAyHoGrammarParseTest >> testParse2A [
	forest := grammar parse: 'aa'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 6
]

{ #category : #tests }
JEAyHoGrammarParseTest >> testParse3A [
	forest := grammar parse: 'aaa'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4
]

{ #category : #tests }
JEAyHoGrammarParseTest >> testParse4A [
	forest := grammar parse: 'aaaa'.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAyHoGrammarParseTest >> testParseEpsilon [
	forest := grammar parse: ''.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]
