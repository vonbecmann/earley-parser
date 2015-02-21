comparing
equals: anObject
	^ (Symbol subclasses includes: anObject class) and: [ anObject first isLetter and: [ anObject first isUppercase  ]  ]