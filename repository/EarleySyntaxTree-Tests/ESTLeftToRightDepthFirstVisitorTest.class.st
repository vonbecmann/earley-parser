Class {
	#name : #ESTLeftToRightDepthFirstVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'parseTree'
	],
	#category : #'EarleySyntaxTree-Tests-Implementation'
}

{ #category : #running }
ESTLeftToRightDepthFirstVisitorTest >> setUp [
	parseTree := nil.
	grammar := ESTExemplar binaryNumber
]

{ #category : #tests }
ESTLeftToRightDepthFirstVisitorTest >> testCollectSymbols [
	| symbols |
	parseTree := grammar parseTree: '1'.

	symbols := 
	Array
		streamContents: [ :s | 
			ESTLeftToRightDepthFirstVisitor new
				preOrderBlock: [ :node | s nextPut: node model symbol ];
				visit: parseTree ].
	self
		assert: symbols
		equals:
			{(NCNonterminal named: 'binary number').
			(NCNonterminal named: 'bit sequence').
			(NCNonterminal named: 'bit').
			(NCNonterminal named: 'one symbol').
			(NCTerminal character: $1)}
]

{ #category : #tests }
ESTLeftToRightDepthFirstVisitorTest >> testCollectSymbols02 [
	| symbols |
	parseTree := grammar parseTree: '0'.

	symbols := 
	Array
		streamContents: [ :s | 
			ESTLeftToRightDepthFirstVisitor new
				preOrderBlock: [ :node | s nextPut: node model symbol ];
				visit: parseTree ].

	self 
		assert: symbols 
		equals: 
				{(NCNonterminal named: 'binary number').
				(NCNonterminal named: 'bit sequence').
				(NCNonterminal named: 'bit').
				(NCNonterminal named: 'zero symbol').
				(NCTerminal character: $0)}
]

{ #category : #tests }
ESTLeftToRightDepthFirstVisitorTest >> testVisitedCount [
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	parseTree := grammar parseTree: '1010100011011'.

	ESTLeftToRightDepthFirstVisitor new
		preOrderBlock: [ firstCount := firstCount + 1 ];
		postOrderBlock: [ secondCount := secondCount + 1 ];
		visit: parseTree.

	self assert: firstCount equals: secondCount
]

{ #category : #tests }
ESTLeftToRightDepthFirstVisitorTest >> testVisitedCount01 [
	| firstCount secondCount |
	firstCount := 0.
	secondCount := 0.
	parseTree := grammar parseTree: '1010100011011'.

	ESTLeftToRightDepthFirstVisitor new
		preOrderBlock: [ firstCount := firstCount + 1 ];
		visit: parseTree.

	ESTLeftToRightDepthFirstVisitor new
		postOrderBlock: [ secondCount := secondCount + 1 ];
		visit: parseTree.

	self assert: firstCount equals: secondCount
]
