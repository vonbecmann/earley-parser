comparing
hash
	^ members first
		ifNil: [ (self class hash + nil identityHash) hashMultiply ]
		ifNotNil: [ 
			((self class hash + members first identityHash) hashMultiply
				+ members second identityHash) hashMultiply ]