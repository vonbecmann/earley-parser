comparing
= anObject
	^ self class == anObject class
		and: [ members first == anObject first 
			and: [ members second == anObject second ] ]