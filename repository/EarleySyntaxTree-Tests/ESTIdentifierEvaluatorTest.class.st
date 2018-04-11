Class {
	#name : #ESTIdentifierEvaluatorTest,
	#superclass : #TestCase,
	#instVars : [
		'evaluator'
	],
	#category : 'EarleySyntaxTree-Tests-Grammar'
}

{ #category : #initialization }
ESTIdentifierEvaluatorTest >> setUp [

	evaluator := 
	ESSingleSynthesizedAttributeEvaluator 
		grammar: 	ESTExemplar identifier
		actions: 
		{('identifier' -> 1
				-> [ :nodes | 
					String
						streamContents: [ :s | 
							s
								nextPut: nodes first;
								nextPutAll: nodes second ] ]).
			('word symbol star' -> 1
				-> [ :nodes | 
					String
						streamContents: [ :s | 
							s
								nextPut: nodes first;
								nextPutAll: nodes second ] ]).
			('word symbol star' -> 2 -> [ String empty ])}
]

{ #category : #tests }
ESTIdentifierEvaluatorTest >> testEvaluate01 [
	self 
		assert: (evaluator evaluate: 'word_symbol') 
		equals: 'word_symbol'
]

{ #category : #tests }
ESTIdentifierEvaluatorTest >> testEvaluate02 [
	self 
		assert: (evaluator evaluate: 'word_') 
		equals: 'word_'
]
