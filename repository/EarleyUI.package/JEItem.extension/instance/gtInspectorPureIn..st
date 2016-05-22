*EarleyUI
gtInspectorPureIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Pure' ];
		display: [ {('dottedRule' -> self dottedRule). 
						('startChart' -> self startChart).
						('endChart' -> self endChart).
						('key' -> self key)} ];
		column: 'Name' evaluated: [ :each | each key ] width: 100;
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself