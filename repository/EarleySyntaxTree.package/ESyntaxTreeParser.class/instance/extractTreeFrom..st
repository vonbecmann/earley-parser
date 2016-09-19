private operations
extractTreeFrom: aSPPForest
	| builder |
	builder := ESIdentityTreeBuilder new.
	aSPPForest
		depthVisitPreNode: nil
		postNode: nil
		preFamily: [ :family | 
			family parent model == aSPPForest root
				ifTrue: [ builder root: family children first model ]
				ifFalse: [ 
					builder
						addNode: family parent model
						withChildren: (family children collect: [ :each | each model ]) ] ]
		postFamily: nil.
	^ builder build