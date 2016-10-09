visiting
visit: aNode withPostAction: aBlockWithOneNodeArgument
	(self withPreAction: nil andPostAction: aBlockWithOneNodeArgument) visit: aNode