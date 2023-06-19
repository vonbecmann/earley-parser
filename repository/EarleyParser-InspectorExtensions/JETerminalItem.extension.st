Extension { #name : #JETerminalItem }

{ #category : #'*EarleyParser-InspectorExtensions' }
JETerminalItem >> displayValueOn: aStream [
	terminal printOn: aStream
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JETerminalItem >> inspectionPureIn: aBuilder [

	^ (super inspectionPureIn: aBuilder)
		  items: ({ 
				   ('terminal' -> self terminal).
				   ('word' -> word).
				   (#start -> self start).
				   (#end -> self end) } collect: [ :each | 
					   StInspectorAssociationNode hostObject: each ]);
		  yourself
]
