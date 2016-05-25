comparing
hash
	^ self inject: self class hash into: [ :hash :each | (hash + each hash) hashMultiply ]