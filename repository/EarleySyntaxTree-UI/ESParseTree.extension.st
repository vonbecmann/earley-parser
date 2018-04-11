Extension { #name : #ESParseTree }

{ #category : #'*EarleySyntaxTree-UI' }
ESParseTree >> gtInspectorASTWordsIn: composite [
	<gtInspectorPresentationOrder: 3>
	^ (tree gtInspectorBrowserIn: composite)
		title: 'AST->>words<<';
		send: [ :each | 
			String
				streamContents: [ :s | 
					s nextPutAll: '>>'.
					ESTDepthFirstVisitor new 
						preOrderBlock: [ :node | 
							node model isTerminal
								ifTrue: [ s nextPut: node model reason ] ];
						visitNode: each.
					s nextPutAll: '<<' ] ];
		yourself
]

{ #category : #'*EarleySyntaxTree-UI' }
ESParseTree >> gtInspectorBrowseIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ (tree gtInspectorBrowserIn: composite)
		title: 'Browse';
		send: [ :each | each model ];
		yourself
]

{ #category : #'*EarleySyntaxTree-UI' }
ESParseTree >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ (tree gtInspectorViewIn: composite)
		send: [ :each | each model ];
		yourself
]
