"
a context free grammar.

nonterminals - is a set of nonterminals. they should be unique.
terminals - is a set of terminals. they should be unique.
rules - is a set of rules. they should be unique.

startSymbol - a nonterminal named START  used by the algorithm.
	the given grammar is augmented with this nonterminal.
startRule - the first rule to initialize the algorithm.
	START : first nonterminal.
		
alternatives - is a set of rules that you can access by a pair (nonterminal, index).
predictedAlternatives - is a set of predicted dotted rules that you can access by nonterminal. 
	 they are obtain from the given rules.




"
Class {
	#name : #JEGrammar,
	#superclass : #Object,
	#instVars : [
		'nonterminals',
		'terminals',
		'productionRules',
		'rules',
		'startSymbol',
		'startRule',
		'alternatives',
		'predictedAlternatives'
	],
	#category : #'EarleyParser-Core-Public'
}

{ #category : #'instance creation' }
JEGrammar class >> productionRules: productionRulesArray representations: terminalNotionToRepresentationList [
	"
	a grammar based on a collection of rules, starting at the first rule's left hand.
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
		{	('plus symbol' -> (JETerminal character: $+)).
			('star symbol' -> (JETerminal character: $*)).
			('letter a symbol' -> (JETerminal character: $a)). }.
	""
	"

	| nonterminals terminals productionRules productionRuleSet productionRuleIndex nonterminalIndex |
	self assert: productionRulesArray isNotEmpty description: 'The collection of rules cannot be empty.'.
	self assert: terminalNotionToRepresentationList isNotEmpty description: 'The collection of rules cannot be empty.'.
	nonterminals := productionRulesArray collect: [ :each | JENonterminal named: each first ] as: Set.
	nonterminals addAll: (terminalNotionToRepresentationList collect: [ :eachAssociation | JENonterminal named: eachAssociation key ]).
	terminals := terminalNotionToRepresentationList collect: [ :eachAssociation | eachAssociation value ] as: Set.
	productionRules := OrderedCollection new.
	productionRules
		addAll:
			(productionRulesArray
				collect: [ :each | 
					JEProductionRule
						head: (nonterminals detect: [ :nonterminal | nonterminal named = each first ])
						body:
							(each second
								collect:
									[ :notionNamed | nonterminals detect: [ :nonterminal | nonterminal named = notionNamed ] ifNone: [ self unknowNonterminal: notionNamed in: each ] ]) ]).
	productionRules
		addAll:
			(terminalNotionToRepresentationList
				collect: [ :eachAssociation | 
					JEProductionRule
						head: (nonterminals detect: [ :nonterminal | nonterminal named = eachAssociation key ])
						body: {(terminals like: eachAssociation value)} ]).
	productionRuleSet := Set withAll: productionRules.
	productionRuleIndex := [ | index |
		index := Dictionary newFrom: (productionRuleSet collect: [ :rule | rule -> (productionRules findFirst: [ :each | rule = each ]) ]).
		[ :a :b | (index at: a) < (index at: b) ] ] value.
	nonterminalIndex := [ | index |
		index := Dictionary newFrom: (nonterminals collect: [ :each | each -> (productionRules findFirst: [ :rule | rule head = each ]) ]).
		[ :a :b | (index at: a) < (index at: b) ] ] value.
	^ self basicNew
		initializeNonterminals: (nonterminals sorted: nonterminalIndex) 
		terminals: terminals
		rules: (productionRuleSet sorted: productionRuleIndex)
		startNonterminal: productionRules first head
]

{ #category : #private }
JEGrammar class >> unknowNonterminal: symbol in: rule [
	^ Error signal: 'Unknown Nonterminal ' , symbol asString , ' in ' , rule asString
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
	startSymbol := JENonterminal start.
	nonterminals := SinglyLinkedList with: startSymbol.
	terminals := Set new.
	productionRules := ArrayMultiValuedDictionary dictionary: OrderedDictionary.
	rules := ArrayMultiValuedDictionary dictionary: OrderedDictionary.
	alternatives := OrderedDictionary new.
	predictedAlternatives := ArrayMultiValuedDictionary dictionary: OrderedIdentityDictionary
]

{ #category : #initialization }
JEGrammar >> initializeAlternatives [
	nonterminals
		reject: [ :each | each = startSymbol ]
		thenDo: [ :nonterminal | 
			(productionRules at: nonterminal)
				withIndexDo: [ :each :index | alternatives at: (JEOrderedPair first: nonterminal second: index) put: each ] ]
]

{ #category : #initialization }
JEGrammar >> initializeNonterminals: nonterminalCollection terminals: terminalCollection rules: productionRuleCollection startNonterminal: aNonterminal [
	self initialize.
	nonterminals addAll: nonterminalCollection.
	terminals addAll: terminalCollection.
	productionRuleCollection do: [ :each | productionRules at: each head put: each ].
	productionRuleCollection
		collect: [ :rule | JERule head: rule head body: rule body copy ]
		thenDo: [ :eachRule | rules at: eachRule head put: eachRule ].
	startRule := JERule head: startSymbol body: {aNonterminal}.
	rules at: startSymbol put: startRule.
	self initializeAlternatives.
	self initializePredictedAlternatives
]

{ #category : #initialization }
JEGrammar >> initializePredictedAlternatives [
	rules
		keysAndValuesDo:
			[ :nonterminal :alternative | 
				predictedAlternatives at: nonterminal put: alternative dotAtBeginning ]
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

{ #category : #accessing }
JEGrammar >> ruleAt: anAssociation [
	"an association like
		aNamedNonterminal -> index   : the rule at index for a named nonterminal
	example:
		'A' -> 1  : the rule at 1 for nonterminal named 'A'
		
	returns the rule definition at position index for a named nonterminal"

	| nonterminal key |
	nonterminal := self nonterminal: anAssociation key.
	key := JEOrderedPair first: nonterminal second: anAssociation value.
	^ alternatives at: key ifAbsent: [ self unknowRuleAt: key ]
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
	^ rules size
]

{ #category : #'instance creation' }
JEGrammar >> startAt: aNonterminalNamed [
	"a grammar based on a collection of rules, starting at the given nonterminal."

	| newStart definedRules |
	newStart := self nonterminal: aNonterminalNamed.
	definedRules := productionRules
		reject: [ :each | each head = startSymbol ]
		thenCollect: [ :each | each ].
	^ self class basicNew
		initializeNonterminals: (nonterminals reject: [ :each | each = startSymbol ])
		terminals: terminals
		rules: definedRules values
		startNonterminal: newStart
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
JEGrammar >> unknowRuleAt: keyPair [
	^ Error
		signal:
			(String
				streamContents: [ :s | 
					s
						nextPutAll: 'Unknown rule''s definition at index ';
						print: keyPair second;
						nextPutAll: ' for Nonterminal ';
						print: keyPair first ])
]
