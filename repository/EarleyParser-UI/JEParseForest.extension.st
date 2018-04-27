Extension { #name : #JEParseForest }

{ #category : #'*EarleyParser-UI' }
JEParseForest >> gtInspectorBrowseIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ syntaxTree gtInspectorBrowserIn: composite
]

{ #category : #'*EarleyParser-UI' }
JEParseForest >> gtInspectorSyntaxTreeViewIn: composite [
	<gtInspectorPresentationOrder: 10>
	^ syntaxTree gtInspectorViewIn: composite
]
