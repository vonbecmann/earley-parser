visiting
visit: aNode withPreAction: aBlockWithOneNodeArgument
	(self withPreAction: aBlockWithOneNodeArgument andPostAction: nil) visit: aNode