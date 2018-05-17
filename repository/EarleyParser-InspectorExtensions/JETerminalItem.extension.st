Extension { #name : #JETerminalItem }

{ #category : #'*EarleyParser-InspectorExtensions' }
JETerminalItem >> displayValueOn: aStream [
	terminal printOn: aStream
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JETerminalItem >> gtInspectorPureIn: composite [
	^ (super gtInspectorPureIn: composite)
		display: 
			[ {('terminal' -> self terminal).
				('word' -> word).
				(#start -> self start).
				(#end -> self end)} ];
		yourself
]
