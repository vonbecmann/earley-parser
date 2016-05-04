accessing
top
	"Answer the first element of the stack without removing it."

	^ firstLink valueIfEmptyDo: [ Error signal: 'collection is empty!' ]