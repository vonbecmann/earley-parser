initialization
initializeFirst: firstPackedNode andSecond: secondPackedNode
	self initialize.
	first := firstPackedNode.
	second := secondPackedNode.
	children := first
		ifNil: [ Array empty ]
		ifNotNil: [ second
				ifNil: [ {first} ]
				ifNotNil: [ {first. second} ] ]