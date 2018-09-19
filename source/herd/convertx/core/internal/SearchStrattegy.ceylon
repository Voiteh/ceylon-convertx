import herd.convertx.core.api.component {
	ComponentFindingException
}
import ceylon.logging {
	trace
}
import herd.convertx.core {
	logger
}

shared interface SearchStrattegy {
	
	throws(`class ComponentFindingException`)
	shared formal Flatten search(Container container,[Anything*] args); 
	
}

shared SearchStrattegy defaultStrategy => object satisfies SearchStrattegy{
	shared actual Flatten search(Container container, [Anything*] args) {
		//until resolved https://github.com/eclipse/ceylon/issues/7389 hashing for Touple arg will fail. 
		value hashable=Hashable(*args);
		logger.debug("Looking for Executable using Hashable:``hashable``");
		if (exists findable = container.get(hashable)) {
			logger.debug("FOUND Executable ``findable``");
			return findable;
		}
		logger.debug("Executable NOT FOUND by Hashable ``hashable``");
		if(logger.priority>=trace){
			logger.trace("Available Hashables were:");
			container.filter((Findable elementKey -> Flatten elementItem) => elementKey is Hashable)
					.each((Findable findable -> Flatten executable) => logger.trace("``findable``-> ``executable``"));
		}
		if (exists matchable = container.keys.narrow<Matchable>()
			.filter((Matchable element) => element.match(args))
				.sort((Matchable x, Matchable y) => y.priority.compare(x.priority))
				.first){
			if(exists findable= container.get(matchable)){
				return findable;
			}
		}
		throw ComponentFindingException("Can't find component, for provided arguments: ``args``");
	}
	
	
};