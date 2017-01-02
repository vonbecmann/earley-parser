*EarleyParser-UI
gtInspectorPureIn: composite
	^ (super gtInspectorPureIn: composite)
		display: 
			[ {('key' -> self key).
				('dottedRule' -> self dottedRule).
				(#start -> self start).
				(#end -> self end)} ];
		yourself