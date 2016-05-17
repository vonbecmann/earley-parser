comparing
hash
	^ ((self class hash + self dotIndex hash) hashMultiply + self rule identityHash) hashMultiply