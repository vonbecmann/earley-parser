comparing
equals: anItem
	^ self class == anItem class and: [ startChart = anItem startChart and: [ terminal = anItem terminal ] ]