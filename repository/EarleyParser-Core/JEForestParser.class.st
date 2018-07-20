"
Jay Earley Algorithm as a Parser.
It will return a parse forest .
"
Class {
	#name : #JEForestParser,
	#superclass : #JEBSPPFParser,
	#category : #'EarleyParser-Core-Implementation'
}

{ #category : #public }
JEForestParser >> parse: words [
	"returns a parse forest"

	^ JEParseForest given: (super parse: words) of: grammar
]
