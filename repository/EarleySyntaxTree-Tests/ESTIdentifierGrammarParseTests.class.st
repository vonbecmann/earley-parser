Class {
	#name : #ESTIdentifierGrammarParseTests,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'tree'
	],
	#category : 'EarleySyntaxTree-Tests-Grammar'
}

{ #category : #running }
ESTIdentifierGrammarParseTests >> setUp [
	tree := nil.
	grammar := ESTExemplar identifier
]

{ #category : #tests }
ESTIdentifierGrammarParseTests >> testAsArrayRepresentation01 [
	tree := grammar parseTree: 'word_symbol'.
	self
		assertCollection: tree asArrayRepresentation
		equals: #(#($w) #(#($o) #(#($r) #(#($d) #(#($_) #(#($s) #(#($y) #(#($m) #(#($b) #(#($o) #(#($l) #())))))))))))
]

{ #category : #tests }
ESTIdentifierGrammarParseTests >> testParse01 [
	tree := grammar parseTree: 'word_symbol'.
	self
		assertCollection: tree leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('identifier' -> 1).
					('letter symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 2)})
]

{ #category : #tests }
ESTIdentifierGrammarParseTests >> testParse02 [
	tree := grammar parseTree: 'word_symbol'.
	self
		assertCollection: tree rightmostDerivation 
		equals:
			(grammar
				rulesAtAll:
					{('identifier' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 1).
					('word symbol star' -> 2).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('word symbol' -> 1).
					('letter symbol' -> 1). })
]
