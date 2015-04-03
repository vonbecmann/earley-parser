testing
includes: anItem
	^ (itemsByChart at: anItem startChart ifAbsentPut: [ OrderedCollection new ]) includes: anItem