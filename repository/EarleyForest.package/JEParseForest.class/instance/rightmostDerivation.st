accessing
rightmostDerivation
	| derivation |
	derivation := SinglyLinkedList new.
	syntaxTree
		depthVisitPreNode: nil
		postNode: nil
		preFamily: nil
		postFamily: [ :family | 
			(family parent model isNonterminal 
				and: [ family parent model isFinal ])
					ifTrue: [ derivation addFirst: family parent model rule asDefined ] ].
	^ derivation asArray