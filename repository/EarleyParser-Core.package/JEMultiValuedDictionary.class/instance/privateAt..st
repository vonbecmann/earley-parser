private
privateAt: key
	"it always return a instance of collectionClass"

	^ dictionary at: key ifAbsentPut: [ collectionClass new ]