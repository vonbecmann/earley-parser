private operations
buildForestFrom: finalItem
	"remove the START symbol from the forest, so the root is the first nonterminal of the grammar"

	| startNode startFamily |
	startNode := finalItem node.
	self assert: startNode familiesSize = 1.
	startFamily := startNode children first.
	self assert: startFamily children size = 1.
	^ JEBSPPForest root: startFamily first