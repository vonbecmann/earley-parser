*EarleyParser-UI
gtInspectorPureIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Pure' ];
		display: [ {('head' -> self head)}
				, (self body withIndexCollect: [ :each :index | ('body at: ' , index asString) -> each ]) ];
		column: 'Name' evaluated: [ :each | each key ] width: 100;
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself