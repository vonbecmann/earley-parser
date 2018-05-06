"
left to right 
depth first tree visitor.

"
Class {
	#name : #ESTDepthFirstVisitor,
	#superclass : #ESTreeVisitor,
	#category : 'EarleySyntaxTree-Implementation'
}

{ #category : #visiting }
ESTDepthFirstVisitor >> visitNode: aGivenTreeNode [
	| visitStack |
	visitStack := SinglyLinkedStack with: (JEOrderedPair first: aGivenTreeNode second: false).
	[ visitStack isEmpty ]
		whileFalse: 
			[ 	| element node visited |
				element := visitStack top.
				node := element first.
				visited := element second.
				visited
					ifTrue: 
						[	visitStack pop.
							postOrderBlock ifNotNil: [ postOrderBlock cull: node ] ]
					ifFalse: 
						[	element second: true.
							preOrderBlock ifNotNil: [ preOrderBlock cull: node ].
							node children reverseDo: [ :child | visitStack push: (JEOrderedPair first: child second: false) ] ] ]
]
