private operations
extractTreeFrom: aSPPForest
	| builder |
	builder := ESTreeBuilder new.
	aSPPForest
		depthVisitPreNode: nil
		postNode: nil
		preFamily: [ :family | 
			builder
				addNode: family parent model
				withChildren: (family members collect: [ :each | each model ]) ]
		postFamily: nil.
	builder root: aSPPForest root.
	^ builder build