initialization
initializeMembers: aPackedNodePair
	self initialize.
	members := aPackedNodePair.
	children := members first
		ifNil: [ Array empty ]
		ifNotNil: [ 
			members second
				ifNil: [ {members first} ]
				ifNotNil: [ {members first. members second} ] ]