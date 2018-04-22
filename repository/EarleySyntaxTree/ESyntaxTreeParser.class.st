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

{ #category : #public }
ESyntaxTreeParser >> parse: words [
	| forest |
	forest := super parse: words.
	self assert: forest isAmbiguous not.
	^ ESParseTree given: forest extractSingleTree of: grammar
]
