private operations
buildTreeRootedFrom: aSPPForest
	"
	a backward directed tree with all backward path from aNode. 
	it's a binary shared packed parse forest. it's rank is 3.
	"

	| builder tree |
	builder := JEHypergraphBuilder new.
	aSPPForest
		depthVisitPreNode: nil
		postNode: nil
		preFamily: [ :family | 
			builder
				addEdgeSourceNodes: (family members collect: [ :each | each model ])
				targetNode: family parent model ]
		postFamily: nil.
	builder rootNode: aSPPForest root.
	tree := builder build.
	self assert: tree rank <= 3.
	^ tree