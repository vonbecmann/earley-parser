instance creation
productionRules: productionRulesArray representations: terminalNotionToRepresentationList
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

	| productionRules representationRules |
	self assert: productionRulesArray isNotEmpty description: 'The collection of rules cannot be empty.'.
	self assert: terminalNotionToRepresentationList isNotEmpty description: 'The collection of rules cannot be empty.'.
	productionRules := productionRulesArray
		collect: [ :each | 
			JEProductionRule
				head: (JENonterminal named: each first)
				body: (each second collect: [ :notionNamed | JENonterminal named: notionNamed ]) ].
	representationRules := terminalNotionToRepresentationList
		collect:
			[ :eachAssociation | JEProductionRule head: (JENonterminal named: eachAssociation key) body: {eachAssociation value} ].
	^ self basicNew initializeRules: productionRules , representationRules startNonterminal: productionRules first head