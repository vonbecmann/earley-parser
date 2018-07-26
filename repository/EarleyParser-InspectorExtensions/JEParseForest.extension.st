Extension { #name : #JEParseForest }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEParseForest >> gtInspectorBrowserIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ syntaxForest gtInspectorBrowserIn: composite
]
