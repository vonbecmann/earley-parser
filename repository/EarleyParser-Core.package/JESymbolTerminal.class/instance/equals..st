comparing
equals: anObject
	^ (Symbol subclasses includes: anObject class) and: [ symbol = anObject ]