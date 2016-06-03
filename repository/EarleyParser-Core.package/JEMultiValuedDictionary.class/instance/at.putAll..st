accessing
at: key putAll: aCollection
	| found |
	found := self privateAt: key.
	found addAll: aCollection.
	^ aCollection