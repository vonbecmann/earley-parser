*EarleyParser-UI
gtInspectorRulesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ rules size asString , ' rules' ];
		display: [ alternatives associations ];
		column: 'Key' evaluated: [ :each | each key ] width: 150;
		column: 'Rule' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		showOnly: 50;
		yourself