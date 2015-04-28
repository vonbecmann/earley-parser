running
testBuild
	| graph |
	graph := builder build.
	self assert: graph nodesIsEmpty.
	self assert: graph edgesIsEmpty