gt-inspector-extension
gtInspectorEdgesIn: composite
	<gtInspectorPresentationOrder: 1>
	| all |
	all := edges values flatCollect: [:each | each asArray].
	^ composite table
		title: all size asString , ' edges';
		display: all;
		column: 'Label' evaluated: [ :each | each descriptionLabel ];
		column: 'From' evaluated: [ :each | each from ];
		column: 'To' evaluated: [ :each | each to ];
		showOnly: 50;
		yourself