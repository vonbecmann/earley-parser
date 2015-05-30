private
makeFlatEdgeFrom: anEdge
	"intermediate nodes have one edge, in other words the source nodes
	at an intermediate node is a collection with one element"

	| flatSourceNodes stack |
	flatSourceNodes := JELinkedList new.
	stack := JEStack withAll: anEdge sourceNodes.
	[ stack isEmpty ]
		whileFalse: [ 
			| aNode |
			aNode := stack pop.
			aNode isSingle
				ifTrue: [ flatSourceNodes add: aNode ]
				ifFalse: [ (sourceNodesByTarget at: aNode) first reverseDo: [ :each | stack push: each ] ] ].
	^ JEDirectedHyperedge 
		labeled: anEdge label 
		sourceNodes: flatSourceNodes asArray 
		targetNode: anEdge targetNode