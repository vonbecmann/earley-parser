instance creation
withAll: aCollection
	"Create a new stack containing all the elements from aCollection."

	^ self new
		pushAll: aCollection;
		yourself