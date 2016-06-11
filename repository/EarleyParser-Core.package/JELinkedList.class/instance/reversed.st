converting
reversed
	^ self
		inject: self class new
		into: [ :reversed :each | 
			reversed
				addFirst: each;
				yourself ]