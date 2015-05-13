public
forestStartingAtNodeLike: anItem
	^ (nodes 
			select: [ :each | each label = anItem ]) 
					flatCollect: [ :each | self forestStartingAt: each ]