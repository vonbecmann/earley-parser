accessing
atPosition: anInteger
	^ self new
		position: anInteger - 1;
		signal