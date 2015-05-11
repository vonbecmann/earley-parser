gt-inspector-extension
gtInspectorPointersIn: composite
	<gtInspectorPresentationOrder: 1>
	| all |
	all := pointers values flatCollect: [ :each | each asArray ].
	^ composite table
		title: all size asString , ' pointers';
		display: all;
		column: 'Pointer labeled from an item back to a previous item [down to a child item]' 
			evaluated: [ :each | each ];
		showOnly: 50;
		yourself