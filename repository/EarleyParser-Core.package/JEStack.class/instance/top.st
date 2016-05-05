accessing
top
	"Answer the first element of the stack without removing it."

	^ firstLink 
			ifNil: [ Error signal: 'collection is empty!' ] 
			ifNotNil: [ firstLink value ]