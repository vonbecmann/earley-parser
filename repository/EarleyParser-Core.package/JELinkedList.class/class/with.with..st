instance creation
with: anObject with: anotherObject
	"Answer an instance of me containing anObject and anotherObject."

	^ self new
		add: anObject;
		add: anotherObject;
		yourself