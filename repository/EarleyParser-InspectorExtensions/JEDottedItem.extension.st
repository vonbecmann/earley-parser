Extension { #name : #JEDottedItem }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEDottedItem >> displayValueOn: aStream [
	dottedRule printOn: aStream
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEDottedItem >> gtInspectorPureIn: composite [
	^ (super gtInspectorPureIn: composite)
		display: 
			[ {	('dottedRule' -> self dottedRule).
				(#start -> self start).
				(#end -> self end)} ];
		yourself
]
