private operations
buildTreeRootedAt: anItem
	"it's a binary shared packed parse forest. it's rank is 3."

	| tree |
	tree := self buildTreeRootedAtNode: anItem node.
	self assert: tree rank <= 3.
	^ tree