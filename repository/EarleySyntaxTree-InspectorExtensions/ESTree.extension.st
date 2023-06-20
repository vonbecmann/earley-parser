Extension { #name : #ESTree }

{ #category : #'*EarleySyntaxTree-InspectorExtensions' }
ESTree >> inspectionBrowserIn: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Browse'>
	^ aBuilder newTree
		  roots: { root };
		  children: [ :each | each children ];
		  yourself
]
