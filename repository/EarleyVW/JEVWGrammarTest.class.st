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

{ #category : #'tests - hypernotion' }
JEVWGrammarTest >> testAcceptsHypernotion [
	self assertGrammarStartingAt: 'hypernotion' accepts: 'long'
]

{ #category : #'tests - hypernotion' }
JEVWGrammarTest >> testAcceptsHypernotion02 [
	self assertGrammarStartingAt: 'hypernotion' accepts: 'iN'
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

{ #category : #'tests - metanotion' }
JEVWGrammarTest >> testAcceptsMetanotion04 [
	self assertGrammarStartingAt: 'metanotion' accepts: 'LETTER'
]

{ #category : #'tests - metanotion' }
JEVWGrammarTest >> testAcceptsMetanotion05 [
	self assertGrammarStartingAt: 'metanotion' accepts: 'TAG1'
]

{ #category : #'tests - metarule' }
JEVWGrammarTest >> testAcceptsMetarule [
	self assertGrammarStartingAt: 'metarule' accepts: 'EMPTY:: .'
]

{ #category : #'tests - metarule' }
JEVWGrammarTest >> testAcceptsMetarule02 [
	self assertGrammarStartingAt: 'metarule' accepts: 'EMPTY::.'
]

{ #category : #'tests - metarule' }
JEVWGrammarTest >> testAcceptsMetarule03 [
	self assertGrammarStartingAt: 'metarule' accepts: 'LETTER:: a; b; c.'
]

{ #category : #'tests - metarule' }
JEVWGrammarTest >> testAcceptsMetarule04 [
	self assertGrammarStartingAt: 'metarule' accepts: 'N:: ; iN.'
]

{ #category : #'tests - metarule' }
JEVWGrammarTest >> testAcceptsMetarule05 [
	self assertGrammarStartingAt: 'metarule' accepts: 'N:: iN; .'
]

{ #category : #'tests - protonotion' }
JEVWGrammarTest >> testAcceptsProtonotion [
	self assertGrammarStartingAt: 'protonotion' accepts: 'long'
]

{ #category : #'tests - protonotion' }
JEVWGrammarTest >> testAcceptsProtonotion02 [
	self assertGrammarStartingAt: 'protonotion' accepts: 'short'
]

{ #category : #'tests - protonotion' }
JEVWGrammarTest >> testAcceptsProtonotion03 [
	self assertGrammarStartingAt: 'protonotion' accepts: 'i'
]

{ #category : #'tests - protonotion' }
JEVWGrammarTest >> testAcceptsProtonotion04 [
	self assertGrammarStartingAt: 'protonotion' accepts: 'program'
]
