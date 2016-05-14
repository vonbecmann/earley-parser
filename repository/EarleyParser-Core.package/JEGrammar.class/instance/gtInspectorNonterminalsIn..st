gt-inspector-extension
gtInspectorNonterminalsIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: nonterminals size asString , ' nonterminals';
		display: nonterminals;
		column: 'Nonterminals' evaluated: [ :each | each ];
		showOnly: 50;
		yourself