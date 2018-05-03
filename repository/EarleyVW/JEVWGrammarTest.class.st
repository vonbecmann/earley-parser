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
	self assertGrammarStartingAt: 'hypernotion' accepts: 'i N'
]

{ #category : #'tests - hypernotion' }
JEVWGrammarTest >> testAcceptsHypernotion03 [
	self assertGrammarStartingAt: 'hypernotion' accepts: 'letter ALPHA'
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

{ #category : #'tests - metaproduction rule' }
JEVWGrammarTest >> testAcceptsMetaproductionRule [
	self assertGrammarStartingAt: 'metaproduction rule' accepts: 'EMPTY:: .'
]

{ #category : #'tests - metaproduction rule' }
JEVWGrammarTest >> testAcceptsMetaproductionRule02 [
	self assertGrammarStartingAt: 'metaproduction rule' accepts: 'EMPTY::.'
]

{ #category : #'tests - metaproduction rule' }
JEVWGrammarTest >> testAcceptsMetaproductionRule03 [
	self assertGrammarStartingAt: 'metaproduction rule' accepts: 'LETTER:: a; b; c.'
]

{ #category : #'tests - metaproduction rule' }
JEVWGrammarTest >> testAcceptsMetaproductionRule04 [
	self assertGrammarStartingAt: 'metaproduction rule' accepts: 'N:: ; i N.'
]

{ #category : #'tests - metaproduction rule' }
JEVWGrammarTest >> testAcceptsMetaproductionRule05 [
	self assertGrammarStartingAt: 'metaproduction rule' accepts: 'N:: i N; .'
]

{ #category : #'tests - metaproduction rule' }
JEVWGrammarTest >> testAcceptsMetaproductionRule06 [
	self 
		assertGrammarStartingAt: 'metaproduction rule' 
		accepts: 'INTREAL:: SIZETY integral; SIZETY real.'
]

{ #category : #'tests - metaproductions' }
JEVWGrammarTest >> testAcceptsMetaproductions [
	self 
		assertGrammarStartingAt: 'metaproductions' 
		accepts: 
'TALLY:: 		i TALLETY.
TALLETY:: 	TALLY; EMPTY.
EMPTY:: 		.
LETTER:: 		a; b; c.'
]

{ #category : #'tests - metaproductions' }
JEVWGrammarTest >> testAcceptsMetaproductions02 [
	self 
		assertGrammarStartingAt: 'metaproductions' 
		accepts: 
'VALUE:: 	i VALETY.
VALETY:: 	VALUE; EMPTY.
EMPTY:: 	.'
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
