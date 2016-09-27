comparing
= anObject
	^ self class == anObject class
		and: [ parent == anObject parent
				and: [ first == anObject first 
					and: [ second == anObject second ] ] ]