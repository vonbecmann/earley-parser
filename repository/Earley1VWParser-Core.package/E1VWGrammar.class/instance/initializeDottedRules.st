initialization
initializeDottedRules
	rules do: [ :eachRule | dottedRules at: eachRule putAll: eachRule dottedRules ]