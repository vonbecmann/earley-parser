accessing
members
	| asCollection |
	asCollection := JELinkedList new.
	members first ifNotNil: [ asCollection add: members first ].
	members second ifNotNil: [ asCollection add: members second ].
	^ asCollection