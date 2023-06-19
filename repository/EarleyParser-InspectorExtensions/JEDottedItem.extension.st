Extension { #name : #JEDottedItem }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEDottedItem >> displayValueOn: aStream [
	dottedRule printOn: aStream
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEDottedItem >> inspectionBrowserIn: aBuilder [

	"to be fix: use asArray for the moment. a linked list doesn't implement sum"

	<inspectorPresentationOrder: 2 title: 'Browse'>
	^ aBuilder newTree
		  roots: { self };
		  children: [ :each | each children asArray ];
		  yourself
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEDottedItem >> inspectionPureIn: aBuilder [

	^ (super inspectionPureIn: aBuilder)
		  items: ({ 
				   ('dottedRule' -> self dottedRule).
				   (#start -> self start).
				   (#end -> self end) } collect: [ :each | 
					   StInspectorAssociationNode hostObject: each ]);
		  yourself
]
