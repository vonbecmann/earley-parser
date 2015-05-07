comparing
equals: anObject
	^ (Symbol subclasses includes: anObject class) and: [ self symbol = anObject ]