*EarleyParser-UI
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ 'Items' ];
		display: [ self associations ];
		column: 'Key' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ];
		column: 'Values'
			evaluated: [ :each | 
			GTObjectPrinter new
				asNonTruncatedTextFrom: 
					((String 	streamContents: [ :s | self printValues: each value on: s ]) truncateWithElipsisTo: 50) ];
		send: [ :each | each value ];
		showOnly: 50;
		yourself