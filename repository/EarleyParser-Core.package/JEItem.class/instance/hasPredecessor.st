testing
hasPredecessor
	^ edges anySatisfy: [ :edge | edge isPredecessor ]