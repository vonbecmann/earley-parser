"
Jay Earley Algorithm as a Syntax Tree Parser.
It will return a syntax parse tree
you know that the forest has only one tree, so you extract that tree.
and also you flatten that tree so it correspond with the grammar.


"
Class {
	#name : #ESyntaxTreeParser,
	#superclass : #JEBSPPFParser,
	#category : 'EarleySyntaxTree-Implementation'
}

{ #category : #'private operations' }
ESyntaxTreeParser >> flatten: extractedTree [
	| stack |
	stack := SinglyLinkedStack new.
	ESTDepthFirstVisitor new
		postOrderBlock: [ :node | 
			node model isFinal
				ifTrue: [ | finalNode |
					finalNode := ESTreeNode model: node model.
					node children isEmpty
						ifFalse: [ | newChildren |
							newChildren := SinglyLinkedStack new.
							node model dottedRule body size timesRepeat: [ newChildren push: stack pop ].
							finalNode children: newChildren asArray ].
					stack push: finalNode ] ];
		visit: extractedTree.
	self assert: [ stack size = 1 ].
	^ ESTree rootNode: stack pop
]

{ #category : #public }
ESyntaxTreeParser >> parse: words [
	| forest |
	forest := super parse: words.
	self assert: forest isAmbiguous not.
	^ ESParseTree 
		given: (self transformToSyntax: (self flatten: forest extractSingleTree)) 
		of: grammar
]

{ #category : #'private operations' }
ESyntaxTreeParser >> transformToSyntax: flattenTree [
	| stack |
	stack := SinglyLinkedStack new.
	ESTDepthFirstVisitor new 
		postOrderBlock: [ :node | 
			 node model isTerminal 
					ifTrue: 
						[	stack
								push: (ESTreeNode model: 
											(ESSyntaxNode 
												symbol: node model terminal
												reason: node model word
												start: node model start number
												end: node model end number)) ] 
					ifFalse: 
						[	| nonterminalNode |
							nonterminalNode := (ESTreeNode model:
														(ESSyntaxNode 
															symbol: node model rule head 
															reason: node model rule asDefined
															start: node model start number
															end: node model end number)).
							node children isEmpty
								ifFalse: 
									[	| newChildren |
										newChildren := SinglyLinkedStack new.
										node children size timesRepeat: [ newChildren push: stack pop ].
										nonterminalNode children: newChildren asArray ].
							stack push: nonterminalNode ] ];
		visit: flattenTree.
		
	self assert: [ stack size = 1 ].
	^ ESTree rootNode: stack pop
]
