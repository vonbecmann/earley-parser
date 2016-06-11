accessing
at: key putAll: aCollection
	self privateAt: key putAll: aCollection.
	^ aCollection