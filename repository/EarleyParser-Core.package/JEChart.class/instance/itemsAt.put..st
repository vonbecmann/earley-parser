private
itemsAt: chart put: anItem
	(itemsByChart at: chart number) addLast: anItem.
	^ anItem