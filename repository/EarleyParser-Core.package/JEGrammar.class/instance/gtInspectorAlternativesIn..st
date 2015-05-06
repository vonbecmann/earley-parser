gt-inspector-extension
gtInspectorAlternativesIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: 'Alternatives';
		display: [ alternatives associations ];
		send: [ :each | each value ];
		column: 'Nonterminal' 
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ];
		column: 'Dotted Rules' 
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each value ];
		showOnly: 50;
		yourself