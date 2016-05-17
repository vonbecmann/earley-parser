*EarleyUI
gtInspectorItemsByChartIn: composite
	<gtInspectorPresentationOrder: 3>
	^ composite table
		title: [ ' By Start Chart' ];
		display: [ itemsByChart associations sorted: [ :a :b | a key < b key ] ];
		send: [ :each | each value ];
		column: '@ start' evaluated: [ :each | each key ];
		column: 'Items'
			evaluated: [ :each | 
			(String streamContents: [ :s | each value do: [ :item | item printOn: s ] separatedBy: [ s nextPutAll: ', ' ] ])
				truncateWithElipsisTo: 50 ];
		showOnly: 50;
		yourself