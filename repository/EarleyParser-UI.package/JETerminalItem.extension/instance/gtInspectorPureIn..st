*EarleyParser-UI
gtInspectorPureIn: composite
	^ (super gtInspectorPureIn: composite)
		display: 
			[ {('terminal' -> self terminal).
				('word' -> word).
				(#start -> self start).
				(#end -> self end)} ];
		yourself