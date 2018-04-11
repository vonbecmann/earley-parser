"
right to left
depth first tree visitor.

"
Class {
	#name : #ESTRightToLeftDepthFirstVisitor,
	#superclass : #ESTreeVisitor,
	#category : 'EarleySyntaxTree-Implementation'
}

{ #category : #visiting }
ESTRightToLeftDepthFirstVisitor >> visitNode: aGivenTreeNode [
	| visitStack |
	visitStack := SinglyLinkedStack with: { aGivenTreeNode. false }.
	[ visitStack isEmpty ]
		whileFalse: [ 
			| element node visited |
			element := visitStack top.
			node := element first.
			visited := element second.
			visited
				ifTrue: 
					[	visitStack pop.
						postOrderBlock ifNotNil: [ postOrderBlock cull: node ] ]
				ifFalse: 
					[	element at: 2 put: true.
						preOrderBlock ifNotNil: [ preOrderBlock cull: node ].
						node children do: [ :child | visitStack push: { child. false. } ] ] ]
]
