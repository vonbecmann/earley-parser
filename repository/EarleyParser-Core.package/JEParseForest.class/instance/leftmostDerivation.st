accessing
leftmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	JEDepthFirstVisitor new
		preOrderFamilyBlock: [ :family | 
			(family parent model isNonterminal and: [ family parent model isFinal ])
				ifTrue: [ derivation addLast: family parent model rule asDefined ] ];
		visit: syntaxTree.
	^ derivation asArray