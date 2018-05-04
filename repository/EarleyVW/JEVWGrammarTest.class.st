Class {
	#name : #JEVWGrammarTest,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'protonotion',
		'metanotion',
		'hypernotion',
		'metaproductionRule',
		'hyperRule',
		'metaproductions',
		'hyperRules'
	],
	#category : #'EarleyVW-Tests'
}

{ #category : #asserting }
JEVWGrammarTest >> assertGrammarAccepts: words [
	self assertGrammarAt: grammar accepts: words
]

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

{ #category : #initialization }
JEVWGrammarTest >> setUp [
	grammar := JEVWParser vwGrammar.
	protonotion := grammar startAt: 'protonotion'.
	metanotion := grammar startAt: 'metanotion'.
	hypernotion := grammar startAt: 'hypernotion'.
	metaproductionRule := grammar startAt: 'metaproduction rule'.
	hyperRule := grammar startAt: 'hyper rule'.
	metaproductions := grammar startAt: 'metaproductions'.
	hyperRules := grammar startAt: 'hyper rules'
]

{ #category : #tests }
JEVWGrammarTest >> testAccepts [
	self
		assertGrammarAccepts:
'TALLY:: 		i TALLETY.
TALLETY:: 	TALLY; EMPTY.
EMPTY:: 		.
LETTER:: 		a; b; c.
		
program: 				TALLY as, TALLY bs, TALLY cs.

i TALLY LETTER s: 	i LETTER s, TALLY LETTER s.
i LETTER s: 			LETTER symbol.'
]

{ #category : #tests }
JEVWGrammarTest >> testAccepts02 [
	self
		assertGrammarAccepts:
'ALPHA:: 		a; b; c; d; e.

s:  		ALPHA.
ALPHA: 	letter ALPHA symbol;
			ALPHA, letter ALPHA symbol.'
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

{ #category : #'tests - hyper rules' }
JEVWGrammarTest >> testAcceptsHyperRules [
	self 
		assertGrammarAt: hyperRules 
		accepts: 
'program:	 			TALLY as, TALLY bs, TALLY cs.
i TALLY LETTER s: 	i LETTER s, TALLY LETTER s.
i LETTER s: 			LETTER symbol.'
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
		assertGrammarAt: metaproductions
		accepts: 
'TALLY:: 		i TALLETY.
TALLETY:: 	TALLY; EMPTY.
EMPTY:: 		.
LETTER:: 		a; b; c.'
]

{ #category : #'tests - metaproductions' }
JEVWGrammarTest >> testAcceptsMetaproductions02 [
	self 
		assertGrammarAt: metaproductions
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
