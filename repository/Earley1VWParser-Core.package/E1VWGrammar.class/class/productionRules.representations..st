instance creation
productionRules: productionRulesArray representations: terminalNotionToRepresentationList
	"
	Production Rules
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
	productionRules := productionRulesArray
		collect: 
			[ :each | 
				JEProductionRule
					head: (JENonterminal named: each first)
					body: (each second collect: [ :notionNamed | JENonterminal named: notionNamed ]) ].
	representationRules := terminalNotionToRepresentationList 
		collect: 
			[ :eachAssociation |
				JEProductionRule 
					head: (JENonterminal named: eachAssociation key)
					body: { eachAssociation value } ].
	^ self basedOn: (productionRules, representationRules) 