Extension { #name : #JEFamily }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEFamily >> inspectionBrowserIn: aBuilder [

	"to be fix: use asArray for the moment. a linked list doesn't implement sum"

	<inspectorPresentationOrder: 1 title: 'Browse'>
	^ aBuilder newTree
		  roots: { self };
		  children: [ :each | each children asArray ];
		  yourself
]
