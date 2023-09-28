"
builds a grammar with the given production rules and representations but take into consideration the following restrictions:

production rules are unique and all of them use the same nonterminal and terminal objects.
nonterminals are unique.
terminals are unique.
start nonterminal is the first production rule's head (left hand).

Representation Rules are like these 
{	('plus symbol' -> (NCTerminal character: $+)).
	('star symbol' -> (NCTerminal character: $*)).
	('letter a symbol' -> (NCTerminal character: $a)). }


"
Class {
	#name : #JEGrammarBuilder,
	#superclass : #Object,
	#instVars : [
		'productionRules',
		'representations',
		'terminals',
		'nonterminals',
		'startNonterminal'
	],
	#category : #'EarleyParser-Core-Public'
}

{ #category : #building }
JEGrammarBuilder >> build [
	"	given the production and representation rules builds a grammar
		according to the conditions. see class comment "

	| lineup unique index |
	self assert: productionRules isNotEmpty.
	self assert: representations isNotEmpty.
	self initializeTerminals.
	self initializeNonterminals.
	self initializeStartNonterminal.
	lineup :=
		(productionRules collect: [ :each | each makeCopyGiven: self ]),
		(representations collect: [ :assoc | assoc buildProductionRuleGiven: self ]).
	unique := lineup asSet.
	index := IdentityDictionary new.
	unique do: [ :rule | index at: rule put: (lineup indexOf: rule) ].
	^ self
		newGrammarWith: (unique sorted: [ :a :b | (index at: a) < (index at: b) ])
]

{ #category : #initialization }
JEGrammarBuilder >> initialize [
	productionRules := representations := #()
]

{ #category : #initialization }
JEGrammarBuilder >> initializeNonterminals [
	nonterminals := (representations
		collect: [ :assoc | NCNonterminal named: assoc key ]
		as: Set) , (productionRules collect: [ :each | each head ] as: Set)
]

{ #category : #initialization }
JEGrammarBuilder >> initializeStartNonterminal [
	startNonterminal := self nonterminalLike: productionRules first head
]

{ #category : #initialization }
JEGrammarBuilder >> initializeTerminals [
	terminals := representations
		collect: [ :assoc | assoc value ]
		as: Set
]

{ #category : #private }
JEGrammarBuilder >> newGrammarWith: sortedRules [
	| newGrammar |
	newGrammar := JEGrammar
		nonterminals: nonterminals
		terminals: terminals
		productionRules: sortedRules
		startNonterminal: startNonterminal.
	self reset.
	^ newGrammar
]

{ #category : #private }
JEGrammarBuilder >> nonTerminalNamed: symbol [
	^ nonterminals detect: [ :nonterminal | nonterminal named = symbol ]
]

{ #category : #private }
JEGrammarBuilder >> nonterminalLike: aGivenNonterminal [
	^ nonterminals
		like: aGivenNonterminal
		ifAbsent: [ Error signal: 'Unknown Nonterminal ' , aGivenNonterminal asString ]
]

{ #category : #accessing }
JEGrammarBuilder >> productionRules: productionRuleCollection [
	self
		assert: productionRuleCollection isNotEmpty
		description: 'The collection of production rules cannot be empty.'.
	productionRules := productionRuleCollection
]

{ #category : #accessing }
JEGrammarBuilder >> representations: terminalNotionToRepresentationList [
	self
		assert: terminalNotionToRepresentationList isNotEmpty
		description: 'The collection of representation rules cannot be empty.'.
	representations := terminalNotionToRepresentationList
]

{ #category : #initialization }
JEGrammarBuilder >> reset [
	productionRules := representations := #().
	terminals := nonterminals := startNonterminal := nil
]

{ #category : #private }
JEGrammarBuilder >> terminalLike: aGivenTerminal [
	^ terminals like: aGivenTerminal
]
