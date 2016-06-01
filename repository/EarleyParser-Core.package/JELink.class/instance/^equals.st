comparing
= anObject
	^ self class == anObject class 
		and: [ self value = anObject value
			and: [ self nextLink == anObject nextLink ] ]