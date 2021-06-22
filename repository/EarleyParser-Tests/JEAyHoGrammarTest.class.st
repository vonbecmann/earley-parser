"
Practical Earley Parsing
John Aycock
R. Nigel Horspool
page 2, figure 2



"
Class {
	#name : #JEAyHoGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEAyHoGrammarTest >> setUp [
	super setUp.
	grammar := JEExemplar AyHo
]

{ #category : #tests }
JEAyHoGrammarTest >> testAccepts1A [
	self assert: (grammar accepts: 'a')
]

{ #category : #tests }
JEAyHoGrammarTest >> testAccepts2A [
	self assert: (grammar accepts: 'aa')
]

{ #category : #tests }
JEAyHoGrammarTest >> testAccepts3A [
	self assert: (grammar accepts: 'aaa')
]

{ #category : #tests }
JEAyHoGrammarTest >> testAccepts4A [
	self assert: (grammar accepts: 'aaaa')
]

{ #category : #tests }
JEAyHoGrammarTest >> testAcceptsEpsilon [
	self assert: (grammar accepts: '')
]
