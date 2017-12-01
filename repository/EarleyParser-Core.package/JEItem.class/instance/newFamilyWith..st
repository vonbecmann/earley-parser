parsing
newFamilyWith: anItem
	^ self isPredicted
		ifTrue: [ JEFamily with: anItem node ]
		ifFalse: [ JEFamily with: self node with: anItem node ]