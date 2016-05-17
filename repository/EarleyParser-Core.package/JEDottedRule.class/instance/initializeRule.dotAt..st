initialization
initializeRule: aRule dotAt: index
	self initialize.
	rule := aRule.
	dotIndex := index.
	final := rule body size < dotIndex.
	predicted := dotIndex = 1 and: [ final not ]