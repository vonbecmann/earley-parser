Class {
	#name : #ESTRightToLeftDepthFirstVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'parseTree'
	],
	#category : 'EarleySyntaxTree-Tests-Implementation'
}

{ #category : #running }
ESTRightToLeftDepthFirstVisitorTest >> setUp [
	parseTree := nil.
	grammar := ESTExemplar binaryNumber
]

{ #category : #tests }
ESTRightToLeftDepthFirstVisitorTest >> testVisitedCount [
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	parseTree := grammar parseTree: '101010001101'.

	ESTRightToLeftDepthFirstVisitor new
		preOrderBlock: [ firstCount := firstCount + 1 ];
		postOrderBlock: [ secondCount := secondCount + 1 ];
		visit: parseTree.
		
	self assert: firstCount equals: secondCount
]

{ #category : #tests }
ESTRightToLeftDepthFirstVisitorTest >> testVisitedCount01 [
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	parseTree := grammar parseTree: '10110001101'.

	ESTRightToLeftDepthFirstVisitor new
		preOrderBlock: [ firstCount := firstCount + 1 ];
		visit: parseTree.

	ESTRightToLeftDepthFirstVisitor new
		postOrderBlock: [ secondCount := secondCount + 1 ];
		visit: parseTree.
		
	self assert: firstCount equals: secondCount
]
