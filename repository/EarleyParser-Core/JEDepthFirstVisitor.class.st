"
left to right 
depth first visitor 
of 
a binary shared packed parse forest.


"
Class {
	#name : #JEDepthFirstVisitor,
	#superclass : #JEBSPPFVisitor,
	#category : #'EarleyParser-Core-BSPPForest'
}

{ #category : #visiting }
JEDepthFirstVisitor >> visitNode: aPackedOrFamilyNode [
	" status: notvisited -> visited -> done"

	| visitStack visited |
	visitStack := SinglyLinkedStack with: aPackedOrFamilyNode.
	visited := IdentityDictionary new.
	[ visitStack isEmpty ]
		whileFalse: [ | element status |
			element := visitStack top.
			status := visited at: element ifAbsent: #notvisited.
			status == #notvisited
				ifTrue: [ 
					visited at: element put: #visited.
					element acceptPreOrderVisitor: self.
					element children reverseDo: [ :child | visitStack push: child ] ]
				ifFalse: [ 
					status == #visited
						ifTrue: [ 
							visitStack pop.
							element acceptPostOrderVisitor: self.
							visited at: element put: #done ]
						ifFalse: [ 
							status == #done
								ifTrue: [ visitStack pop ] ] ] ]
]
