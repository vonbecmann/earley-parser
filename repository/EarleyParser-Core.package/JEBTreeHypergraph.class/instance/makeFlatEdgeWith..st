private
makeFlatEdgeWith: anEdge
	"intermediate nodes have one edge, in other words the source nodes
	at an intermediate node is a collection with one element"
	
	| newSourceNodes stack |
	newSourceNodes := OrderedCollection new.
	stack := JEStack withAll: anEdge sourceNodes.
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