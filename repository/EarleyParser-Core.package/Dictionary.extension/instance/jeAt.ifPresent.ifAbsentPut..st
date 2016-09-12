*EarleyParser-Core
jeAt: key ifPresent: aBlock ifAbsentPut: absentBlock
	"
	Set the value at key to be anObject.  
	If key is not found, create a new entry for key and set is value to anObject. Answer anObject.
	If it is present, answer the value of evaluating the given block with the value associated with the key. 
	"

	| index assoc |
	index := self findElementOrNil: key.
	assoc := array at: index.
	^ assoc
		ifNil: [ | anObject |
			anObject := absentBlock value.
			self atNewIndex: index put: (Association key: key value: anObject).
			anObject ]
		ifNotNil: [ aBlock value: assoc value ]