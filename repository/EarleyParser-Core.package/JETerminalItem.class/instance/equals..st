comparing
equals: anItem
	^ (super equals: anItem) and: [ terminal = anItem terminal ]