*EarleyParser-Core
jeAdd: newObject
	"Include newObject as one of the receiver's elements, but only if
	not already present. Answer newObject.
	If it is present then returns that element"

	| index element |
	index := self scanFor: newObject.
	element := array at: index.
	^ element
		ifNil: [ 
			self atNewIndex: index put: newObject asSetElement.
			newObject ]
		ifNotNil: [ element ]