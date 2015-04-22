running
testBuild
	| graph |
	graph := builder build.
	self assert: graph nodes isEmpty.
	self assert: graph edges isEmpty