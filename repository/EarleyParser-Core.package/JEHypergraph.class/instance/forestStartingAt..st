public
forestStartingAt: aNode
	| forest visitedEdges visitedNodes stack |
	forest := OrderedCollection new.
	visitedEdges := Set new.
	visitedNodes := Set new.
	stack := Stack new.
	stack push: aNode.
	[ stack isEmpty ]
		whileFalse: [ 
			| currentNode |
			currentNode := stack pop.
			(visitedNodes includes: currentNode)
				ifFalse: [ 
					| nodeEdges |
					nodeEdges := (self edgesFor: currentNode) difference: visitedEdges.
					forest add: currentNode.
					visitedNodes add: currentNode.
					nodeEdges
						do: [ :each | 
							visitedEdges add: each.
							(each nodes difference: visitedNodes) asOrderedCollection sort reverseDo: [ :eachNode | stack push: eachNode ] ] ] ].
	^ forest