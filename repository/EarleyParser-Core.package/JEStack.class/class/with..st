instance creation
with: anObject
	"Answer an instance of me containing anObject."

	^ self new
		push: anObject;
		yourself