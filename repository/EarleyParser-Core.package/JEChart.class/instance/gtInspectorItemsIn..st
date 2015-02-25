inspector
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: self size asString , ' items';
		display: items;
		column: 'Rule with dot' evaluated: [ :each | each ruleWithDot ];
		column: 'Chart' evaluated: [ :each | each chart ];
		showOnly: 50