Extension { #name : #JETerminalItem }

{ #category : #'*EarleyParser-UI' }
JETerminalItem >> displayValueOn: aStream [
	terminal printOn: aStream
]

{ #category : #'*EarleyParser-UI' }
JETerminalItem >> gtInspectorPureIn: composite [
	^ (super gtInspectorPureIn: composite)
		display: 
			[ {('terminal' -> self terminal).
				('word' -> word).
				(#start -> self start).
				(#end -> self end)} ];
		yourself
]
