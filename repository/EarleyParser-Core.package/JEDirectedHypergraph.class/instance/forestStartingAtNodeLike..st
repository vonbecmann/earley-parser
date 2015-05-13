public
forestStartingAtNodeLike: anItem
	^ (nodes
		select: [ :each | each label = anItem head 
									and: [ each from = anItem startChart 
										and: [ each to = anItem endChart ] ] ])
		flatCollect: [ :each | self forestStartingAt: each ]