*EarleyParser-UI
gtInspectorNonterminalsIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ nonterminals size asString , ' nonterminals' ];
		display: [ nonterminals sorted: nonterminalSort ];
		column: 'Nonterminals' evaluated: [ :each | each ];
		showOnly: 50;
		yourself