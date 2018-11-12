"
right to left
depth first tree visitor.

"
Class {
	#name : #ESTRightToLeftDepthFirstVisitor,
	#superclass : #ESTDepthFirst,
	#category : #'EarleySyntaxTree-Implementation'
}

{ #category : #private }
ESTRightToLeftDepthFirstVisitor >> withChildrenOf: node do: aBlock [
	node children do: aBlock
]
