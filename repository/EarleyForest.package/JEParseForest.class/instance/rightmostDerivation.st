accessing
rightmostDerivation
	| derivation |
	derivation := JELinkedList new.
	syntaxTree
		depthVisitPreNode: nil
		postNode: nil
		preFamily: nil
		postFamily: [ :family | 
			(family parent model class = JEDottedItem
				and: [ family parent model isFinal
						and: [ family parent model head ~= grammar startSymbol ] ])
				ifTrue: [ derivation addFirst: family parent model rule asDefined ] ].
	^ derivation asArray