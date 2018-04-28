Class {
	#name : #ESTBinaryNumberEvaluatorTest,
	#superclass : #TestCase,
	#instVars : [
		'evaluator'
	],
	#category : 'EarleySyntaxTree-Tests-Grammar'
}

{ #category : #running }
ESTBinaryNumberEvaluatorTest >> setUp [
	evaluator := ESSingleSynthesizedAttributeEvaluator
		grammar: ESTExemplar binaryNumber
		actions:
			{('bit sequence' -> 2 -> [ :nodes | nodes first << 1 bitOr: nodes second ]).
			('one symbol' -> 1 -> [ 1 ]).
			('zero symbol' -> 1 -> [ 0 ])}
]

{ #category : #tests }
ESTBinaryNumberEvaluatorTest >> testEvaluate01 [
	self assert: (evaluator evaluate: '101') equals: 5
]

{ #category : #tests }
ESTBinaryNumberEvaluatorTest >> testEvaluate02 [
	self assert: (evaluator evaluate: '10') equals: 2
]
