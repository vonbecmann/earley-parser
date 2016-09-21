private operations
extractTreeFrom: aSPPForest
	| builder |
	builder := ESIdentityTreeBuilder new.
	builder root: aSPPForest root.
	aSPPForest
		depthVisitPreNode: nil
		postNode: nil
		preFamily: [ :family | 
			builder
				addNode: family parent model
				withChildren: (family children collect: [ :each | each model ]) ]
		postFamily: nil.
	^ builder build