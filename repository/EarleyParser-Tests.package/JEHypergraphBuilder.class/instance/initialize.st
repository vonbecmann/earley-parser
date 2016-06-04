initialization
initialize
	super initialize.
	root := nil.
	nodes := Set new.
	edges := Set new.
	targetNode := nil.
	accumulatedSourceNodes := OrderedCollection new