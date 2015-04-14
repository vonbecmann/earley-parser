private
itemsAt: chart put: anItem
	(itemsByChart at: chart) add: anItem.
	^ anItem