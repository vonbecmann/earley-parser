comparing
= anObject
	^ self class = anObject class and: [ self regex = anObject regex ]