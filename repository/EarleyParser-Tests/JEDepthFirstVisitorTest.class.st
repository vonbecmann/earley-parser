Class {
	#name : #JEDepthFirstVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'forest'
	],
	#category : #'EarleyParser-Tests-BSPPForest'
}

{ #category : #running }
JEDepthFirstVisitorTest >> setUp [
	super setUp.
	grammar := JEExemplar UBDA.
	forest := nil
]

{ #category : #tests }
JEDepthFirstVisitorTest >> testVisitedFamilyCount01 [
	forest := grammar parse: 'xxxxx'.
	self
		assert: forest preOrderVisitFamilyCount
		equals: forest postOrderVisitFamilyCount
]

{ #category : #tests }
JEDepthFirstVisitorTest >> testVisitedFamilyCount02 [
	forest := grammar parse: 'xxxxxx'.
	self
		assert: forest preOrderVisitFamilyCount
		equals: forest postOrderVisitFamilyCount
]

{ #category : #tests }
JEDepthFirstVisitorTest >> testVisitedNodeCount01 [
	forest := grammar parse: 'xxxxx'.
	self
		assert: forest preOrderVisitNodeCount
		equals: forest postOrderVisitNodeCount
]

{ #category : #tests }
JEDepthFirstVisitorTest >> testVisitedNodeCount02 [
	forest := grammar parse: 'xxxxxx'.
	self
		assert: forest preOrderVisitNodeCount
		equals: forest postOrderVisitNodeCount
]
