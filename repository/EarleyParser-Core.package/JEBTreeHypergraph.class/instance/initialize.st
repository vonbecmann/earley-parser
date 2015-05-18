initialization
initialize
	super initialize.
	sourceNodesByTarget := IdentityDictionary new.
	backwardStar := IdentityDictionary new