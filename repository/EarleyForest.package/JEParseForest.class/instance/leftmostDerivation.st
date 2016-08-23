accessing
leftmostDerivation
	| derivation |
	derivation := JELinkedList new.
	syntaxTree
		depthVisitPreNode: nil
		postNode: nil
		preFamily: [ :family | 
			(family parent model class = JEDottedItem
				and: [ family parent model isFinal 
					and: [ family parent model head ~= grammar startSymbol ] ])
						ifTrue: [ derivation addLast: family parent model rule asDefined ] ]
		postFamily: nil.
	^ derivation asArray