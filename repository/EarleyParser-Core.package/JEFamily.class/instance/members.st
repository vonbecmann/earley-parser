accessing
members
	| asCollection |
	asCollection := OrderedCollection new.
	members first ifNotNil: [ asCollection add: members first ].
	members second ifNotNil: [ asCollection add: members second ].
	^ asCollection