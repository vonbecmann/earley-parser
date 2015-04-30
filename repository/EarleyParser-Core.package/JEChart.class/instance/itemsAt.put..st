private
itemsAt: chart put: anItem
	(itemsByChart at: chart number) add: anItem.
	^ anItem