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
		'representations'
	],
	#category : #'EarleyParser-Core-Public'
}

{ #category : #building }
JEGrammarBuilder >> build [
	"	given the production and representation rules builds a grammar 
		according to the conditions. see class comment "

	| nonterminals terminals lineup unique index rules newGrammar |
	self assert: productionRules isNotEmpty.
	self assert: representations isNotEmpty.
	nonterminals := Set new.
	productionRules do: [ :each | nonterminals add: each head ].
	representations do: [ :assoc | nonterminals add: (NCNonterminal named: assoc key) ].
	terminals := Set new.
	representations do: [ :assoc | terminals add: assoc value ].
	lineup := OrderedCollection new.
	unique := Set new.
	productionRules
		collect: [ :each | 
			NCProductionRule
				head: (nonterminals detect: [ :nonterminal | nonterminal = each head ])
				body:
					(each body
						collect: [ :notion | 
							nonterminals
								detect: [ :nonterminal | nonterminal = notion ]
								ifNone: [ self unknowNonterminal: notion in: each ] ]) ]
		thenDo: [ :rule | 
			lineup add: rule.
			unique add: rule ].
	representations
		collect: [ :assoc | 
			NCProductionRule
				head: (nonterminals detect: [ :nonterminal | nonterminal named = assoc key ])
				body: {(terminals like: assoc value)} ]
		thenDo: [ :rule | 
			lineup add: rule.
			unique add: rule ].
	index := Dictionary new.
	unique
		collect: [ :rule | rule -> (lineup findFirst: [ :each | rule = each ]) ]
		thenDo: [ :assoc | index add: assoc ].
	rules := unique sorted: [ :a :b | (index at: a) < (index at: b) ].
	newGrammar := JEGrammar
		productionRules: rules
		nonterminals: nonterminals
		terminals: terminals
		startNonterminal: rules first head.
	self reset.
	^ newGrammar
]

{ #category : #initialization }
JEGrammarBuilder >> initialize [
	super initialize.
	productionRules := representations := #()
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
	productionRules := representations := #()
]

{ #category : #private }
JEGrammarBuilder >> unknowNonterminal: symbol in: rule [
	^ Error signal: 'Unknown Nonterminal ' , symbol asString , ' in ' , rule asString
]
