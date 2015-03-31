initialization
initialize
	super initialize.
	debugOn := false.
	rules := OrderedCollection new.
	alternatives := Dictionary new