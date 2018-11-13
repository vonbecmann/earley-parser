"
left to right 
depth first tree visitor.

"
Class {
	#name : #ESTLeftToRightDepthFirstVisitor,
	#superclass : #ESTDepthFirstVisitor,
	#category : #'EarleySyntaxTree-Implementation'
}

{ #category : #private }
ESTLeftToRightDepthFirstVisitor >> withChildrenOf: node do: aBlock [
	node children reverseDo: aBlock
]
