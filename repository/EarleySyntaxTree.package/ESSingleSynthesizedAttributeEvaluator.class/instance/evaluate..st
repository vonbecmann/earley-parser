testing
evaluate: aString
	| tree |
	tree := grammar parseTree: aString.
	^ self evaluateTree: tree