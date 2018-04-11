Extension { #name : #JEDottedItem }

{ #category : #'*EarleyParser-UI' }
JEDottedItem >> displayValueOn: aStream [
	dottedRule printOn: aStream
]

{ #category : #'*EarleyParser-UI' }
JEDottedItem >> gtInspectorPureIn: composite [
	^ (super gtInspectorPureIn: composite)
		display: 
			[ {	('dottedRule' -> self dottedRule).
				(#start -> self start).
				(#end -> self end)} ];
		yourself
]
