gt-inspector-extension
gtInspectorAlternativesIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: 'Alternatives';
		display: [ alternatives associations ];
		send: [ :each | each value ];
		column: 'Nonterminal' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ];
		column: 'Dotted Rules'
			evaluated: [ :each | 
					GTObjectPrinter new
						asNonTruncatedTextFrom:
							((String
								streamContents: [ :s | 
									each value
										do: [ :rule | rule printOn: s ]
										separatedBy: [ 
											s
												nextPut: $,;
												space ] ]) truncateWithElipsisTo: 42) ];
		showOnly: 50;
		yourself