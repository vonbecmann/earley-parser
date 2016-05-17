comparing
hash
	^ ((self class hash + self head hash) hashMultiply + self body hash) hashMultiply