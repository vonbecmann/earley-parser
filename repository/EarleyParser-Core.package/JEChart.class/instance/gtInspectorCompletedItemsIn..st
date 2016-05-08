gt-inspector-extension
gtInspectorCompletedItemsIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: 'Completed';
		display: finalItemsByNonterminal associations;
		send: [ :each | each value ];
		column: 'Nonterminal' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ];
		column: 'Completed(final) Items'
			evaluated: [ :each | 
					(String streamContents: [ :s | each value do: [ :item | item printOn: s ] separatedBy: [ s nextPutAll: ', ' ] ])
						truncateWithElipsisTo: 50 ];
		showOnly: 50;
		yourself