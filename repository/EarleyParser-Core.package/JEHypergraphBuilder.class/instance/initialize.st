initialization
initialize
	super initialize.
	nodes := Set new.
	targetNode := nil.
	accumulatedSourceNodes := OrderedCollection new