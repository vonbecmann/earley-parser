"
Single Synthesized Attribute Evaluator.
left to right depth first evaluation in post order.

a grammar's rule  ==> action to be applied

"
Class {
	#name : #ESSingleSynthesizedAttributeEvaluator,
	#superclass : #Object,
	#instVars : [
		'grammar',
		'ruleToAction'
	],
	#category : 'EarleySyntaxTree-Public'
}

{ #category : #'instance creation' }
ESSingleSynthesizedAttributeEvaluator class >> grammar: aGrammar actions: ruleAndActionAssociationCollection [
	"
	rule -> aBlockWithOneArgument.
	rule is an association like (Nonterminal -> index)	
	"

	^ self basicNew
		initializeGrammar: aGrammar
		andRuleToAction: ruleAndActionAssociationCollection
]

{ #category : #public }
ESSingleSynthesizedAttributeEvaluator >> evaluate: aString [
	^ self evaluateTree: (grammar parseTree: aString)
]

{ #category : #public }
ESSingleSynthesizedAttributeEvaluator >> evaluate: aString startingAt: aNonterminalNamed [
	^ self evaluateTree: (grammar parseTree: aString startingAt: aNonterminalNamed)
]

{ #category : #public }
ESSingleSynthesizedAttributeEvaluator >> evaluateTree: aParseTree [
	| stack |
	stack := SinglyLinkedStack new.
	ESTreeVisitor depthFirst new
		postOrderBlock: [ :node | 
			node model isTerminal
				ifTrue: [ stack push: node model reason ]
				ifFalse: [ 
					(ruleToAction at: node model reason ifAbsent: nil)
						ifNotNil: [ :action | 
							| actual |
							actual := 
								node children isEmpty
									ifTrue: [ #() ]
									ifFalse: [ 
										node children size = 1
											ifTrue: [ {stack pop} ]
											ifFalse: [ {(stack popReversed: node children size)} ] ].
							stack
								push:
									(action numArgs == 0
										ifTrue: [ action value ]
										ifFalse: [ action valueWithArguments: actual ]) ] ] ];
		visit: aParseTree.
	self assert: [ stack size = 1 ].
	^ stack pop
]

{ #category : #initialization }
ESSingleSynthesizedAttributeEvaluator >> initialize [
	super initialize.
	ruleToAction := Dictionary new
]

{ #category : #initialization }
ESSingleSynthesizedAttributeEvaluator >> initializeGrammar: aGrammar andRuleToAction: ruleAndActionAssociationCollection [
	"
	rule -> aBlockWithOneArgument.
	rule is an association like (Nonterminal -> index)	
	"

	self initialize.
	grammar := aGrammar.
	ruleAndActionAssociationCollection do: [ :each | ruleToAction at: (grammar ruleAt: each key) put: each value ]
]
