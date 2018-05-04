Class {
	#name : #JEVWGrammarTest,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'protonotion',
		'metanotion',
		'hypernotion',
		'metaproductionRule',
		'hyperRule'
	],
	#category : #'EarleyVW-Tests'
}

{ #category : #asserting }
JEVWGrammarTest >> assertGrammarAt: aGrammar accepts: words [
	self
		assert: (aGrammar accepts: words)
		description:
			(String
				streamContents: [ :s | 
					s
						print: aGrammar;
						nextPutAll: ' doesn''t accept ';
						nextPutAll: words ])
]

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
	grammar := JEVWParser vwGrammar.
	protonotion := grammar startAt: 'protonotion'.
	metanotion := grammar startAt: 'metanotion'.
	hypernotion := grammar startAt: 'hypernotion'.
	metaproductionRule := grammar startAt: 'metaproduction rule'.
	hyperRule := grammar startAt: 'hyper rule'
]

{ #category : #'tests - hyper rule' }
JEVWGrammarTest >> testAcceptsHyperRule [
	self assertGrammarAt: hyperRule accepts: 'empty: .'
]

{ #category : #'tests - hyper rule' }
JEVWGrammarTest >> testAcceptsHyperRule02 [
	self assertGrammarAt: hyperRule accepts: 'NOTION sequence: NOTION; NOTION, NOTION sequence.'
]

{ #category : #'tests - hyper rule' }
JEVWGrammarTest >> testAcceptsHyperRule03 [
	self assertGrammarAt: hyperRule accepts: 'NOTION list: NOTION; NOTION, comma symbol, NOTION list.'
]

{ #category : #'tests - hyper rule' }
JEVWGrammarTest >> testAcceptsHyperRule04 [
	self assertGrammarAt: hyperRule accepts: 'NOTION option: NOTION; .'
]

{ #category : #'tests - hypernotion' }
JEVWGrammarTest >> testAcceptsHypernotion [
	self assertGrammarAt: hypernotion accepts: 'long'
]

{ #category : #'tests - hypernotion' }
JEVWGrammarTest >> testAcceptsHypernotion02 [
	self assertGrammarAt: hypernotion accepts: 'i N'
]

{ #category : #'tests - hypernotion' }
JEVWGrammarTest >> testAcceptsHypernotion03 [
	self assertGrammarAt: hypernotion accepts: 'letter ALPHA'
]

{ #category : #'tests - metanotion' }
JEVWGrammarTest >> testAcceptsMetanotion [
	self assertGrammarAt: metanotion accepts: 'TALLY'
]

{ #category : #'tests - metanotion' }
JEVWGrammarTest >> testAcceptsMetanotion02 [
	self assertGrammarAt: metanotion accepts: 'TALLETY'
]

{ #category : #'tests - metanotion' }
JEVWGrammarTest >> testAcceptsMetanotion03 [
	self assertGrammarAt: metanotion accepts: 'EMPTY'
]

{ #category : #'tests - metanotion' }
JEVWGrammarTest >> testAcceptsMetanotion04 [
	self assertGrammarAt: metanotion accepts: 'LETTER'
]

{ #category : #'tests - metanotion' }
JEVWGrammarTest >> testAcceptsMetanotion05 [
	self assertGrammarAt: metanotion accepts: 'TAG1'
]

{ #category : #'tests - metaproduction rule' }
JEVWGrammarTest >> testAcceptsMetaproductionRule [
	self assertGrammarAt: metaproductionRule accepts: 'EMPTY:: .'
]

{ #category : #'tests - metaproduction rule' }
JEVWGrammarTest >> testAcceptsMetaproductionRule02 [
	self assertGrammarAt: metaproductionRule accepts: 'EMPTY::.'
]

{ #category : #'tests - metaproduction rule' }
JEVWGrammarTest >> testAcceptsMetaproductionRule03 [
	self assertGrammarAt: metaproductionRule accepts: 'LETTER:: a; b; c.'
]

{ #category : #'tests - metaproduction rule' }
JEVWGrammarTest >> testAcceptsMetaproductionRule04 [
	self assertGrammarAt: metaproductionRule accepts: 'N:: ; i N.'
]

{ #category : #'tests - metaproduction rule' }
JEVWGrammarTest >> testAcceptsMetaproductionRule05 [
	self assertGrammarAt: metaproductionRule accepts: 'N:: i N; .'
]

{ #category : #'tests - metaproduction rule' }
JEVWGrammarTest >> testAcceptsMetaproductionRule06 [
	self 
		assertGrammarAt: metaproductionRule 
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
	self assertGrammarAt: protonotion accepts: 'long'
]

{ #category : #'tests - protonotion' }
JEVWGrammarTest >> testAcceptsProtonotion02 [
	self assertGrammarAt: protonotion accepts: 'short'
]

{ #category : #'tests - protonotion' }
JEVWGrammarTest >> testAcceptsProtonotion03 [
	self assertGrammarAt: protonotion accepts: 'i'
]

{ #category : #'tests - protonotion' }
JEVWGrammarTest >> testAcceptsProtonotion04 [
	self assertGrammarAt: protonotion accepts: 'program'
]
