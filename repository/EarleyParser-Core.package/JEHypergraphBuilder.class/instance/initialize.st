initialization
initialize
	super initialize.
	nodes := Set new.
	edges := Set new.
	targetNode := nil.
	accumulatedSourceNodes := SortedCollection sortBlock: [ :a :b | a <= b ]