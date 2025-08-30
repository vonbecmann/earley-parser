Extension { #name : 'JEBSPPForest' }

{ #category : '*EarleyParser-InspectorExtensions' }
JEBSPPForest >> inspectionBrowserIn: aBuilder [

	"to be fix: use asArray for the moment. a linked list doesn't implement sum"

	<inspectorPresentationOrder: 9 title: 'Browse'>
	^ aBuilder newTree
		  roots: { root };
		  children: [ :each | each children asArray ];
		  yourself
]
