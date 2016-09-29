comparing
equals: anItem
	^ self class == anItem class and: [ startChart = anItem startChart and: [ dottedRule = anItem dottedRule ] ]