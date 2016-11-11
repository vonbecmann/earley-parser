accessing
rightmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	JEDepthFirstVisitor new
		postOrderFamilyBlock: [ :family | 
			(family parent model isNonterminal and: [ family parent model isFinal ])
				ifTrue: [ derivation addFirst: family parent model rule asDefined ] ];
		visit: syntaxTree.
	^ derivation asArray