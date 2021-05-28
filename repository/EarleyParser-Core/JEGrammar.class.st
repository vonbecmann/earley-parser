"
a context free grammar.

nonterminals - is a set of nonterminals. they should be unique.
terminals - is a set of terminals. they should be unique.
productionRules - is a set of rules defined by the user.
				you can access by an association (nonterminal -> index).

startSymbol - A distinguished nonterminal symbol that is the start symbol.

startRule - the first rule to initialize the algorithm.
	START : first nonterminal.
	the given grammar is augmented with a nonterminal named START  used by the algorithm.
		
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
JEGrammar class >> nonterminals: nonterminalSet terminals: terminalSet productionRules: productionRuleCollection startNonterminal: aNonterminal [
	" see grammar builder and use it "

	^ self basicNew
		initializeNonterminals: nonterminalSet
			terminals: terminalSet
			productionRules: productionRuleCollection
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
	productionRules := ArrayMultiValuedDictionary dictionary: OrderedDictionary.
	predictedAlternatives := ArrayMultiValuedDictionary dictionary: IdentityDictionary.
	ruleToProductionDict := IdentityDictionary new
	
]

{ #category : #initialization }
JEGrammar >> initializeNonterminals: nonterminalSet terminals: terminalSet productionRules: productionRuleCollection startNonterminal: aNonterminal [
	self initialize.
	nonterminals := nonterminalSet.
	terminals := terminalSet.
	productionRuleCollection
		do: [ :each | 
			| newRule |
			productionRules at: each head put: each.
			newRule := each asJERule.
			predictedAlternatives at: newRule head put: newRule dotAtBeginning.
			ruleToProductionDict at: newRule put: each ].
	startSymbol := aNonterminal.
	startRule := JERule head: (NCNonterminal named: 'START') body: {startSymbol}.
]

{ #category : #private }
JEGrammar >> nonterminal: aNonterminalNamed [
	^ nonterminals
		detect: [ :each | each named = aNonterminalNamed ]
		ifNone: [ 
			Error
				signal:
					(String
						streamContents: [ :s | 
							s
								nextPutAll: 'Unknown Nonterminal ';
								nextPutAll: aNonterminalNamed asString ]) ]
]

{ #category : #accessing }
JEGrammar >> nonterminals [
	^ nonterminals asArray
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
		print: startSymbol;
		nextPut: $)
]

{ #category : #private }
JEGrammar >> productionRuleAt: rule [
	"return the production rule associated with algorithm's rule"

	^ ruleToProductionDict at: rule
]

{ #category : #accessing }
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
		ifAbsent: [ 
			Error
				signal:
					(String
						streamContents: [ :s | 
							s
								nextPutAll: 'Unknown rule''s definition at index ';
								print: anAssociation value;
								nextPutAll: ' for Nonterminal ';
								nextPutAll: 	anAssociation key ]) ]
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
	" a new subgrammar based on a collection of rules, 
	starting at the given nonterminal that acts as the new start symbol."

	^ self class
		nonterminals: nonterminals
		terminals: terminals
		productionRules: productionRules
		startNonterminal: (self nonterminal: aNonterminalNamed)
]

{ #category : #private }
JEGrammar >> startRule [
	^ startRule
]

{ #category : #accessing }
JEGrammar >> startSymbol [
	^ startSymbol
]

{ #category : #accessing }
JEGrammar >> terminals [
	^ terminals asArray
]
