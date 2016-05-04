accessing
top
	"Answer the first element of the stack without removing it."

	^ firstLink valueIfEmpty: [ Error signal: 'collection is empty!' ]