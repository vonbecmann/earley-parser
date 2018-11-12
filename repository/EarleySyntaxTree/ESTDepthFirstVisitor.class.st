"
left to right 
depth first tree visitor.

"
Class {
	#name : #ESTDepthFirstVisitor,
	#superclass : #ESTDepthFirst,
	#category : #'EarleySyntaxTree-Implementation'
}

{ #category : #private }
ESTDepthFirstVisitor >> withChildrenOf: node do: aBlock [
	node children reverseDo: aBlock
]
