Extension { #name : #JEParseForest }

{ #category : #'*EarleyParser-Tests' }
JEParseForest >> postOrderVisitFamilyCount [
	"useful for testing purposes"

	| familyCount |
	familyCount := 0.
	JEDepthFirstVisitor new
		postOrderFamilyBlock: [ familyCount := familyCount + 1 ];
		visit: syntaxForest.
	^ familyCount
]

{ #category : #'*EarleyParser-Tests' }
JEParseForest >> postOrderVisitNodeCount [
	"useful for testing purposes"

	| nodeCount |
	nodeCount := 0.
	JEDepthFirstVisitor new
		postOrderNodeBlock: [ nodeCount := nodeCount + 1 ];
		visit: syntaxForest.
	^ nodeCount
]

{ #category : #'*EarleyParser-Tests' }
JEParseForest >> preOrderVisitFamilyCount [
	"useful for testing purposes"

	| familyCount |
	familyCount := 0.
	JEDepthFirstVisitor new
		preOrderFamilyBlock: [ familyCount := familyCount + 1 ];
		visit: syntaxForest.
	^ familyCount
]

{ #category : #'*EarleyParser-Tests' }
JEParseForest >> preOrderVisitNodeCount [
	"useful for testing purposes"

	| nodeCount |
	nodeCount := 0.
	JEDepthFirstVisitor new
		preOrderNodeBlock: [ nodeCount := nodeCount + 1 ];
		visit: syntaxForest.
	^ nodeCount
]
