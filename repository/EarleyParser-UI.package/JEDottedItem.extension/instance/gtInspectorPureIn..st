*EarleyParser-UI
gtInspectorPureIn: composite
	^ (super gtInspectorPureIn: composite)
		display: 
			[ {	('dottedRule' -> self dottedRule).
				(#start -> self start).
				(#end -> self end)} ];
		yourself