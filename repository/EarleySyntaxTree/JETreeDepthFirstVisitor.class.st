"
left to right 
depth first visitor 
of 
a binary shared packed parse forest that has only one tree.

in other words you visit each node two times.
it isn't ambiguous


"
Class {
	#name : #JETreeDepthFirstVisitor,
	#superclass : #JEDepthFirstVisitor,
	#category : #'EarleySyntaxTree-Implementation'
}

{ #category : #visiting }
JETreeDepthFirstVisitor >> visitNode: aPackedOrFamilyNode [
	" visited: false -> true "

	| visitStack |
	visitStack := SinglyLinkedStack with: (JEOrderedPair first: aPackedOrFamilyNode second: false).
	[ visitStack isEmpty ]
		whileFalse: 
		[ | element node visited |
			element := visitStack top.
			node := element first.
			visited := element second.
			visited
				ifTrue: 
					[	visitStack pop.
						node acceptPostOrderVisitor: self ]
				ifFalse: 
					[ 	element second: true.
						node acceptPreOrderVisitor: self.
						node children reverseDo: [ :child | visitStack push: (JEOrderedPair first: child second: false) ] ] ]
]
