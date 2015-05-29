private
makeFlatEdgeWith: anEdge
	| newSourceNodes stack |
	newSourceNodes := OrderedCollection new.
	stack := JEStack new.
	stack addAll: anEdge sourceNodes.
	[ stack isEmpty ]
		whileFalse: [ 
			| aNode |
			aNode := stack pop.
			aNode isSingle
				ifTrue: [ newSourceNodes add: aNode ]
				ifFalse: [ (self sourceNodesAt: aNode) first reverseDo: [ :each | stack push: each ] ] ].
	^ JEDirectedHyperedge 
			labeled: anEdge label 
			sourceNodes: newSourceNodes asArray 
			targetNode: anEdge targetNode