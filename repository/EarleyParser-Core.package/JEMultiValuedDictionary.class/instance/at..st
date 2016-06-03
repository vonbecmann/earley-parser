accessing
at: key
	^ self
		privateAt: key
		ifAbsent: [ Error
				signal:
					(String
						streamContents: [ :stream | 
							stream
								nextPutAll: 'key ';
								print: key;
								nextPutAll: ' not found' ]) ]