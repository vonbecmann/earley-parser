*EarleyParser-UI
gtInspectorPureIn: composite
	^ (super gtInspectorPureIn: composite)
		display: 
			[ {('terminal' -> self terminal).
				('word' -> word).
				('startChart' -> self startChart).
				('endChart' -> self endChart)} ];
		yourself