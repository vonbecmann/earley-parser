comparing
= anObject
	^ self class = anObject class and: [ charSetRegex = anObject charSetRegex ]