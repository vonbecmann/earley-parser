*EarleyUI
gtInspectorPureIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Pure' ];
		display: [ {	('terminal' -> self terminal). 
						('word' -> word). 
						('startChart' -> self startChart).
						('endChart' -> self endChart).	} ];
		column: 'Name' evaluated: [ :each | each key ] width: 100;
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself