inspector
gtInspectorRulesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: rules size asString , ' rules';
		display:
				(rules copy
						addFirst: self startRule;
						yourself);
		column: 'Rules' evaluated: [ :each | each ];
		showOnly: 50;
		yourself