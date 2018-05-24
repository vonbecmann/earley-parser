"
a context free grammar.

nonterminals - is a set of nonterminals. they should be unique.
terminals - is a set of terminals. they should be unique.
productionRules - is a set of rules defined by the user.
				you can access by an association (nonterminal -> index).

startSymbol - a nonterminal named START  used by the algorithm.
	the given grammar is augmented with this nonterminal.
startRule - the first rule to initialize the algorithm.
	START : first nonterminal.
		
predictedAlternatives - is a set of predicted dotted rules that you can access by nonterminal. 
	 they are obtain from the given rules. 
	is a set of rules used by the algorithm. they should be unique.

ruleToProductionDict - maps algorithm's rule to production rules.
	useful when you get a derivation.



"
Class {
	#name : #JEGrammar,
	#superclass : #Object,
	#instVars : [
		'nonterminals',
		'terminals',
		'productionRules',
		'startSymbol',
		'startRule',
		'predictedAlternatives',
		'ruleToProductionDict'
	],
	#category : #'EarleyParser-Core-Public'
}

{ #category : #private }
JEGrammar class >> productionRules: productionRuleCollection nonterminals: nonterminalSet terminals: terminalSet startNonterminal: aNonterminal [
	" see grammar builder and use it "

	^ self basicNew
		initializeProductionRules: productionRuleCollection
			nonterminals: nonterminalSet
			terminals: terminalSet
			startNonterminal: aNonterminal;
		yourself
]

{ #category : #'instance creation' }
JEGrammar class >> productionRules: productionRuleArray representations: terminalNotionToRepresentationList [
	"	a grammar based on a collection of rules, starting at the first rule's left hand.
	Production Rules
	""
		expression: term.
		expression: expression, plus symbol, term.
		term: product.
		term: term, star symbol, product.
		product: letter a symbol.
	""
	equals 
	#(	#('expression' #('term'))
		#('expression' #('expression' 'plus symbol' 'term'))
		#('term' #('product'))
		#('term' #('term' 'star symbol' 'product'))
		#('product' #('letter a symbol'))
		).
		
	Representation Rules
	""
		{	('plus symbol' -> (NCTerminal character: $+)).
			('star symbol' -> (NCTerminal character: $*)).
			('letter a symbol' -> (NCTerminal character: $a)). }.
	""
	"

	^ JEGrammarBuilder new
		productionRules:
			(productionRuleArray
				collect: [ :each | 
					NCProductionRule
						headNamed: each first
						body: (each second collect: [ :notion | NCNonterminal named: notion ]) ]);
		representations: terminalNotionToRepresentationList;
		build
]

{ #category : #public }
JEGrammar >> accepts: words [
	"answer if the grammar accepts the given words"

	^ (JERecognizer given: self) accepts: words
]

{ #category : #public }
JEGrammar >> accepts: words startingAt: aNonterminalNamed [
	"answer if the grammar accepts the given words starting at a nonterminal"

	^ (self startAt: aNonterminalNamed) accepts: words
]

{ #category : #private }
JEGrammar >> alternativesOf: aNonterminal [
	^ predictedAlternatives at: aNonterminal ifAbsent: #()
]

{ #category : #initialization }
JEGrammar >> initialize [
	super initialize.
	startSymbol := NCNonterminal named: 'START'.
	productionRules := ArrayMultiValuedDictionary dictionary: OrderedDictionary.
	predictedAlternatives := ArrayMultiValuedDictionary dictionary: IdentityDictionary.
	ruleToProductionDict := IdentityDictionary new
	
]

{ #category : #initialization }
JEGrammar >> initializeProductionRules: productionRuleCollection nonterminals: nonterminalSet terminals: terminalSet startNonterminal: aNonterminal [
	| rules |
	self initialize.
	nonterminals := nonterminalSet.
	terminals := terminalSet.
	startRule := JERule head: startSymbol body: {aNonterminal}.
	rules := SinglyLinkedList with: startRule.
	productionRuleCollection
		do: [ :each | 
			| newRule |
			productionRules at: each head put: each.
			newRule := each asJERule.
			rules addLast: newRule.
			ruleToProductionDict at: newRule put: each ].
	rules	do: [ :alternative | predictedAlternatives at: alternative head put: alternative dotAtBeginning ]
]

{ #category : #private }
JEGrammar >> nonterminal: aNonterminalNamed [
	^ nonterminals
		detect: [ :each | each named = aNonterminalNamed ]
		ifNone: [ self unknowNonterminal: aNonterminalNamed ]
]

{ #category : #accessing }
JEGrammar >> nonterminalsSize [
	^ nonterminals size
]

{ #category : #public }
JEGrammar >> parse: words [
	"returns a parse forest"
	"returns a Binary Shared Packed Parse Forest"

	^ (JEForestParser given: self) parse: words
]

{ #category : #printing }
JEGrammar >> printOn: aStream [
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."

	aStream
		nextPutAll: self class name;
		nextPut: $(;
		print: startRule;
		nextPut: $)
]

{ #category : #private }
JEGrammar >> productionRuleAt: rule [
	"return the production rule associated with algorithm's rule"

	^ ruleToProductionDict at: rule
]

{ #category : #private }
JEGrammar >> productionRules [
	^ productionRules values
]

{ #category : #accessing }
JEGrammar >> ruleAt: anAssociation [
	"an association like
		aNamedNonterminal -> index   : the rule at index for a named nonterminal
	example:
		'A' -> 1  : the rule at 1 for nonterminal named 'A'
		
	returns the rule definition at position index for a named nonterminal"

	^ (productionRules at: (self nonterminal: anAssociation key))
		at: anAssociation value
		ifAbsent: [ self unknowRuleAt: anAssociation ]
]

{ #category : #accessing }
JEGrammar >> rulesAtAll: associationCollection [
	"Answer a new collection of rules which contains all rules at the associations of associationCollection.
	an association like
		aNamedNonterminal -> index   : the rule at index for a named nonterminal
	example:
		'A' -> 1  : the rule at 1 for nonterminal named 'A'
	"

	^ Array
		new: associationCollection size
		streamContents: [ :s | associationCollection do: [ :each | s nextPut: (self ruleAt: each) ] ]
]

{ #category : #accessing }
JEGrammar >> rulesSize [
	^ productionRules size
]

{ #category : #'instance creation' }
JEGrammar >> startAt: aNonterminalNamed [
	"a grammar based on a collection of rules, starting at the given nonterminal."

	^ self class
		productionRules: productionRules
		nonterminals: nonterminals
		terminals: terminals
		startNonterminal: (self nonterminal: aNonterminalNamed)
]

{ #category : #private }
JEGrammar >> startRule [
	^ startRule
]

{ #category : #private }
JEGrammar >> startSymbol [
	^ startSymbol
]

{ #category : #private }
JEGrammar >> unknowNonterminal: nonterminal [
	^ Error signal: 'Unknown Nonterminal ' , nonterminal asString
]

{ #category : #private }
JEGrammar >> unknowRuleAt: assoc [
	^ Error
		signal:
			(String
				streamContents: [ :s | 
					s
						nextPutAll: 'Unknown rule''s definition at index ';
						print: assoc value;
						nextPutAll: ' for Nonterminal ';
						nextPutAll: assoc key ])
]
