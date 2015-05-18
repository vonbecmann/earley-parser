public
forestStartingAt: anObject
	^ (nodes select: [ :each | each value = anObject ]) 
				flatCollect: [ :each | self forestStartingAtNode: each ]