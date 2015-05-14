public
forestStartingAtNodeLabeled: anObject
	^ (nodes 
			select: [ :each | each value = anObject ]) 
				flatCollect: [ :each | self forestStartingAt: each ]