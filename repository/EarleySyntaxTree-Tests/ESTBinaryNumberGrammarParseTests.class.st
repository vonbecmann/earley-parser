Class {
	#name : #ESTBinaryNumberGrammarParseTests,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'tree'
	],
	#category : 'EarleySyntaxTree-Tests-Grammar'
}

{ #category : #running }
ESTBinaryNumberGrammarParseTests >> setUp [
	tree := nil.
	grammar := ESTExemplar binaryNumber
]

{ #category : #tests }
ESTBinaryNumberGrammarParseTests >> testAsArrayRepresentation01 [
	tree := grammar parseTree: '101'.
	self 
		assertCollection: tree asArrayRepresentation 
		equals: #(#(#(#(#(#($1))) #(#($0))) #(#($1))))
]

{ #category : #tests }
ESTBinaryNumberGrammarParseTests >> testParse01 [
	tree := grammar parseTree: '101'.
	self
		assertCollection: tree leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('binary number' -> 1).
					('bit sequence' -> 2).
					('bit sequence' -> 2).
					('bit sequence' -> 1).
					('bit' -> 1).
					('one symbol' -> 1).
					('bit' -> 2).
					('zero symbol' -> 1).
					('bit' -> 1).
					('one symbol' -> 1)})
]
