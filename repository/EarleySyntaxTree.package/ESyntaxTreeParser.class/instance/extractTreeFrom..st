private operations
extractTreeFrom: aBSPPForest
	| builder |
	builder := ESIdentityTreeBuilder new.
	builder root: aBSPPForest root.
	JEDepthFirstVisitor new 
		preOrderFamilyBlock: [ :family | 
			builder
				addNode: family parent model
				withChildren: (family children collect: [ :each | each model ]) ];
		visit: aBSPPForest.
	^ builder build