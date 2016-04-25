gt-inspector-extension
gtInspectorNullablesIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: 'Nullables';
		display: [ nullables associations ];
		send: [ :each | each value ];
		column: 'Nonterminal' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ];
		column: 'Nullable?' evaluated: [ :each | each value ];
		showOnly: 50;
		yourself