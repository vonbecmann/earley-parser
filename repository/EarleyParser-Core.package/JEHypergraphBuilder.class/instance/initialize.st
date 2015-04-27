initialization
initialize
	super initialize.
	nodes := Set new.
	edges := Set new.
	targetNode := nil.
	accumulatedSourceNodes := Set new