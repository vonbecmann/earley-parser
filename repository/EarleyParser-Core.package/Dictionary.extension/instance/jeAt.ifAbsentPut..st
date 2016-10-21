*EarleyParser-Core
jeAt: key ifAbsentPut: absentBlock
	"
	Return the value at the given key. 
	If key is not included in the receiver store the result 
	of evaluating aBlock as new value.
	"

	| index assoc |
	index := self findElementOrNil: key.
	assoc := array at: index.
	^ assoc
		ifNil: [ | anObject |
			anObject := absentBlock value.
			self atNewIndex: index put: (Association basicNew key: key value: anObject).
			anObject ]
		ifNotNil: [ assoc value ]