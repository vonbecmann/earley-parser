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
	visitStack := SinglyLinkedStack with: {aPackedOrFamilyNode. false }.
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
					[ 	element at: 2 put: true.
						node acceptPreOrderVisitor: self.
						node children reverseDo: [ :child | visitStack push: { child. false } ] ] ]
]
