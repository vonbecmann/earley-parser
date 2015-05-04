public
forestStartingAtNodeLabeled: anObject
	^ (nodes select: [ :each | each label = anObject ]) flatCollect: [ :each | self forestStartingAt: each ]