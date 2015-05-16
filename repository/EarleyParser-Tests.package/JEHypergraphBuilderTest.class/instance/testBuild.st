running
testBuild
	| graph |
	graph := builder build.
	self assert: graph isEmpty.
