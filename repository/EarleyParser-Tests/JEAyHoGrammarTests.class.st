"
Practical Earley Parsing
John Aycock
R. Nigel Horspool
page 2, figure 2



"
Class {
	#name : #JEAyHoGrammarTests,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEAyHoGrammarTests >> setUp [
	grammar := JEExemplar AyHo
]

{ #category : #tests }
JEAyHoGrammarTests >> testAccepts1A [
	self assert: (grammar accepts: 'a')
]

{ #category : #tests }
JEAyHoGrammarTests >> testAccepts2A [
	self assert: (grammar accepts: 'aa')
]

{ #category : #tests }
JEAyHoGrammarTests >> testAccepts3A [
	self assert: (grammar accepts: 'aaa')
]

{ #category : #tests }
JEAyHoGrammarTests >> testAccepts4A [
	self assert: (grammar accepts: 'aaaa')
]

{ #category : #tests }
JEAyHoGrammarTests >> testAcceptsEpsilon [
	self assert: (grammar accepts: '')
]
