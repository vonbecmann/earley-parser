instance creation
value: anObject next: aLink
	^ (self value: anObject)
		nextLink: aLink;
		yourself