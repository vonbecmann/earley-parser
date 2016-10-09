*EarleySyntaxTree-UI
gtInspectorASTWordsIn: composite
	<gtInspectorPresentationOrder: 3>
	^ (tree gtInspectorBrowserIn: composite)
		title: 'AST->>words<<';
		send: [ :each | 
			String
				streamContents: [ :s | 
					s nextPutAll: '>>'.
					ESTDepthFirstVisitor
						visit: each
						withPreNode: [ :node | 
							node model isTerminal
								ifTrue: [ s nextPut: node model reason ] ].
					s nextPutAll: '<<' ] ];
		yourself