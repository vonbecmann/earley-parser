private
dvisitFrom: aNode
	" TOO EXPENSIVE for large graphs "
	"depth visit from a node. return a collection of nodes in the order that they are visited"

	| visitedNodes stack |
	visitedNodes := OrderedCollection new.
	stack := JEStack with: aNode.
	[ stack isEmpty ]
		whileFalse: [ 
			| currentNode |
			currentNode := stack pop.
			visitedNodes add: currentNode.
			(self backwardStarOf: currentNode) do: [ :edge | edge sourceNodes reverseDo: [ :node | stack push: node ] ] ].
	^ visitedNodes