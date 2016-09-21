comparing
hash
	^ first
		ifNil: [ (self class hash + nil identityHash) hashMultiply ]
		ifNotNil: [ 
			((self class hash + first identityHash) hashMultiply
				+ second identityHash) hashMultiply ]