initialization
initializeRules: aCollection
	rules := OrderedCollection new.
	rules addAll: aCollection.
	self initialize 