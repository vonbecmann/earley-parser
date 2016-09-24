*EarleyParser-UI
gtInspectorPureIn: composite
	^ (super gtInspectorPureIn: composite)
		display: [ {('key' -> self key).
			('dottedRule' -> self dottedRule).
			('startChart' -> self startChart).
			('endChart' -> self endChart)} ];
		yourself