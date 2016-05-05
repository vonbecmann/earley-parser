instance creation
value: anObject next: aLink
	^ (JELink value: anObject)
		nextLink: aLink;
		yourself