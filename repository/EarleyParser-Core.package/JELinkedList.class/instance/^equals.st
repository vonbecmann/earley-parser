comparing
= anObject
	| list1 list2 |
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	self size = anObject size
		ifFalse: [ ^ false ].
	list1 := self firstLink.
	list2 := anObject firstLink.
	[ list1 isNil ]
		whileFalse: [ 
			list1 value = list2 value
				ifFalse: [ ^ false ].
			list1 := list1 nextLink.
			list2 := list2 nextLink ].
	^ true