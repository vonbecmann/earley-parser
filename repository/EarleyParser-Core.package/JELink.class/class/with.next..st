instance creation
with: anObject next: aLink
	"a link with an object as its value and a link as its next link"

	^ (self with: anObject)
		nextLink: aLink;
		yourself