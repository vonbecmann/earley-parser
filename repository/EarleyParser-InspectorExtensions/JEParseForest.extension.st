Extension { #name : #JEParseForest }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEParseForest >> gtInspectorBrowseIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ syntaxTree gtInspectorBrowserIn: composite
]
