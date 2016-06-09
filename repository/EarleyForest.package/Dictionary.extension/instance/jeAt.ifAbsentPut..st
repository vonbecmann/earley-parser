*EarleyForest
jeAt: key ifAbsentPut: anObject
	"
	Set the value at key to be anObject.  
	If key is not found, create a new entry for key and set is value to anObject. Answer anObject.
	If it is present, answer the value associated with the key. 
	"

	| index assoc |
	index := self findElementOrNil: key.
	assoc := array at: index.
	^ assoc
		ifNil: [ 
			self atNewIndex: index put: (Association key: key value: anObject).
			anObject ]
		ifNotNil: [ assoc value ]