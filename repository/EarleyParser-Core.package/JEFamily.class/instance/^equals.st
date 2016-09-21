comparing
= anObject
	^ self class == anObject class
		and: [ first == anObject first 
			and: [ second == anObject second ] ]