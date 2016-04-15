testing
isPredicted
	"when dot is at the beginning of the rule"

	^ self dotIndex = 1 and: [ self isFinal not ]