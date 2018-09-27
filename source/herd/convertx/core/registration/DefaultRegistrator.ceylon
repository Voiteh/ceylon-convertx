
import ceylon.logging {
	logger
}
import herd.convertx.api.configuration {
	Configurable
}
import herd.convertx.core.configuration {
	Logging
}
import herd.convertx.api.operation {
	Operation,
	Convertion,
	Resolvance,
	Creation
}
import herd.convertx.core.operations {
	Executable,
	Findable
}


shared class DefaultRegistrator() satisfies Registrator & Configurable<Logging>{
	value log=logger(`package`);

	shared actual void configure(Logging configuration) {
		log.priority=configuration.priority;
	}


	shared actual void register(Operation.Flatter visitor,Registry registry, Operation[] components) {
		
		components.each((Operation element) {
			assert(is [Findable,Executable] flat=element.flatten(visitor));
			Executable? replaced;
			switch(element)
			case (is Convertion<>) {
				replaced=registry.converters.put(*flat);
			}
			case (is Resolvance<>) {
				replaced=registry.resolvers.put(*flat);
			}
			case (is Creation<>) {
				replaced=registry.creators.put(*flat);
			}
			log.debug("Registered: ``element``");
			if(exists replaced){
				log.warn("Replaced: ``replaced``, with: ``element``");
			}
		});
	}
	
	
}