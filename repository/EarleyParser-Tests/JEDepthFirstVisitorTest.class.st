Class {
	#name : #JEDepthFirstVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'forest',
		'parser'
	],
	#category : #'EarleyParser-Tests-BSPPForest'
}

{ #category : #running }
JEDepthFirstVisitorTest >> setUp [
	super setUp.
	parser := JEBSPPFParser given: JEExemplar UBDA.
	forest := nil
]

{ #category : #tests }
JEDepthFirstVisitorTest >> testVisitedCount01 [
	| firstNodeCount secondNodeCount firstFamilyCount secondFamilyCount |
	firstNodeCount := 0.
	secondNodeCount := 0.
	firstFamilyCount := 0.
	secondFamilyCount := 0.
	forest := parser parse: 'xxxxx'.

	JEDepthFirstVisitor new
		preOrderNodeBlock: [ firstNodeCount := firstNodeCount + 1 ];
		postOrderNodeBlock: [ secondNodeCount := secondNodeCount + 1 ];
		preOrderFamilyBlock: [ firstFamilyCount := firstFamilyCount + 1 ];
		postOrderFamilyBlock: [ secondFamilyCount := secondFamilyCount + 1 ];
		visit: forest.

	self assert: firstNodeCount equals: secondNodeCount.
	self assert: firstFamilyCount equals: secondFamilyCount 
	
]

{ #category : #tests }
JEDepthFirstVisitorTest >> testVisitedFamilyCount01 [
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	forest := parser parse: 'xxxxx'.
	JEDepthFirstVisitor new
		preOrderFamilyBlock: [ firstCount := firstCount + 1 ];
		visit: forest.
	JEDepthFirstVisitor new
		postOrderFamilyBlock: [ secondCount := secondCount + 1 ];
		visit: forest.
	self assert: firstCount equals: secondCount
]

{ #category : #tests }
JEDepthFirstVisitorTest >> testVisitedFamilyCount02 [
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	forest := parser parse: 'xxxxx'.
	JEDepthFirstVisitor new
		preOrderFamilyBlock: [ firstCount := firstCount + 1 ];
		postOrderFamilyBlock: [ secondCount := secondCount + 1 ];
		visit: forest.
	self assert: firstCount equals: secondCount
]

{ #category : #tests }
JEDepthFirstVisitorTest >> testVisitedFamilyCount03 [
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	forest := parser parse: 'xxxxxx'.
	JEDepthFirstVisitor new
		preOrderFamilyBlock: [ firstCount := firstCount + 1 ];
		visit: forest.
	JEDepthFirstVisitor new
		postOrderFamilyBlock: [ secondCount := secondCount + 1 ];
		visit: forest.
	self assert: firstCount equals: secondCount
]

{ #category : #tests }
JEDepthFirstVisitorTest >> testVisitedFamilyCount04 [
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	forest := parser parse: 'xxxxxx'.
	JEDepthFirstVisitor new
		preOrderFamilyBlock: [ firstCount := firstCount + 1 ];
		postOrderFamilyBlock: [ secondCount := secondCount + 1 ];
		visit: forest.
	self assert: firstCount equals: secondCount
]

{ #category : #tests }
JEDepthFirstVisitorTest >> testVisitedNodeCount01 [
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	forest := parser parse: 'xxxxx'.
	JEDepthFirstVisitor new
		preOrderNodeBlock: [ firstCount := firstCount + 1 ];
		visit: forest.
	JEDepthFirstVisitor new
		postOrderNodeBlock: [ secondCount := secondCount + 1 ];
		visit: forest.
	self assert: firstCount equals: secondCount
]

{ #category : #tests }
JEDepthFirstVisitorTest >> testVisitedNodeCount02 [
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	forest := parser parse: 'xxxxx'.
	JEDepthFirstVisitor new
		preOrderNodeBlock: [ firstCount := firstCount + 1 ];
		postOrderNodeBlock: [ secondCount := secondCount + 1 ];
		visit: forest.
	self assert: firstCount equals: secondCount
]
