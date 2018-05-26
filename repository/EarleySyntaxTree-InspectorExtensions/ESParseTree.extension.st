Extension { #name : #ESParseTree }

{ #category : #'*EarleySyntaxTree-InspectorExtensions' }
ESParseTree >> gtInspectorASTWordsIn: composite [
	<gtInspectorPresentationOrder: 3>
	^ (tree gtInspectorBrowserIn: composite)
		title: 'AST->>words<<';
		send: [ :each | 
			String
				streamContents: [ :s | 
					ESTreeVisitor depthFirst new
						preOrderBlock: [ :node | 
							node == each
								ifTrue: [ s nextPutAll: '>>' ].
							node model isTerminal
								ifTrue: [ s nextPut: node model reason ] ];
						postOrderBlock: [ :node | 
							node == each
								ifTrue: [ s nextPutAll: '<<' ] ];
						visit: tree ] ];
		yourself
]

{ #category : #'*EarleySyntaxTree-InspectorExtensions' }
ESParseTree >> gtInspectorBrowseIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ (tree gtInspectorBrowserIn: composite)
		title: 'Browse';
		send: [ :each | each model ];
		yourself
]
