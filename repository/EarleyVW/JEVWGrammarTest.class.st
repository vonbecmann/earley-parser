Class {
	#name : #JEVWGrammarTest,
	#superclass : #TestCase,
	#instVars : [
		'grammar'
	],
	#category : #'EarleyVW-Tests'
}

{ #category : #asserting }
JEVWGrammarTest >> assertGrammarStartingAt: aNonterminalNamed accepts: words [
	self
		assert: (grammar accepts: words startingAt: aNonterminalNamed)
		description:
			(String
				streamContents: [ :s | 
					s
						nextPutAll: 'grammar doesn''t accept ';
						nextPutAll: words ])
]

{ #category : #initialization }
JEVWGrammarTest >> setUp [
	grammar := JEVWParser vwGrammar
]

{ #category : #'tests - metanotion' }
JEVWGrammarTest >> testAcceptsMetanotion [
	self assertGrammarStartingAt: 'metanotion' accepts: 'TALLY'
]

{ #category : #'tests - metanotion' }
JEVWGrammarTest >> testAcceptsMetanotion02 [
	self assertGrammarStartingAt: 'metanotion' accepts: 'TALLETY'
]

{ #category : #'tests - metanotion' }
JEVWGrammarTest >> testAcceptsMetanotion03 [
	self assertGrammarStartingAt: 'metanotion' accepts: 'EMPTY'
]
