private operations
extractTreeFrom: aSPPForest
	| builder |
	builder := ESIdentityTreeBuilder new.
	aSPPForest
		depthVisitPreNode: nil
		postNode: nil
		preFamily: [ :family | 
			family parent model == aSPPForest root
				ifTrue: [ builder root: family members first model ]
				ifFalse: [ 
					builder
						addNode: family parent model
						withChildren: (family members collect: [ :each | each model ]) ] ]
		postFamily: nil.
	^ builder build