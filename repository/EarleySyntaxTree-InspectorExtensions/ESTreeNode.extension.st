Extension { #name : #ESTreeNode }

{ #category : #'*EarleySyntaxTree-InspectorExtensions' }
ESTreeNode >> inspectionBrowserIn: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Browse'>
	^ aBuilder newTree
		  roots: { self };
		  children: [ :each | each children ];
		  yourself
]
