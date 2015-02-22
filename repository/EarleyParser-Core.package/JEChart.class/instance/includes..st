testing
includes: anItem
	^ (itemsByChart at: anItem chart ifAbsentPut: [ OrderedCollection new ]) includes: anItem