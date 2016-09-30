comparing
equals: anItem
	^ (super equals: anItem) and: [ dottedRule = anItem dottedRule ]