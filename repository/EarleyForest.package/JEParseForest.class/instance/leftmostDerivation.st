accessing
leftmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	syntaxTree
		depthVisitPreNode: nil
		postNode: nil
		preFamily: [ :family | 
			(family parent model isNonterminal 
				and: [ family parent model isFinal ])
						ifTrue: [ derivation addLast: family parent model rule asDefined ] ]
		postFamily: nil.
	^ derivation asArray