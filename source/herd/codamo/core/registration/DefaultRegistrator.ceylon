
import ceylon.logging {
	logger
}
import herd.codamo.api.configuration {
	Configurable
}
import herd.codamo.core.configuration {
	LoggingConfiguration
}
import herd.codamo.api.operation {
	Operation,
	Convertion,
	Resolvance,
	Creation
}
import herd.codamo.core.operation {
	Executable,
	Findable
}

"Default Registrator implementation"
shared class DefaultRegistrator() satisfies Registrator & Configurable<LoggingConfiguration>{
	value log=logger(`package`);

	shared actual void configure(LoggingConfiguration configuration) {
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