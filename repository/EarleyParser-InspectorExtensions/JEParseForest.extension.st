Extension { #name : 'JEParseForest' }

{ #category : '*EarleyParser-InspectorExtensions' }
JEParseForest >> inspectionBrowserIn: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Browse'>
	^ syntaxForest inspectionBrowserIn: aBuilder
]
