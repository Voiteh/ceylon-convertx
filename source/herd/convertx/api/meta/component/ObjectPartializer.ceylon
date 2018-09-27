
import herd.convertx.api.meta {
	Partialization,
	Relation,
	filterObjectAndIdentifiableAttributes
}
import ceylon.language.meta.model {
	Class,
	Attribute
}

import ceylon.language.meta {
	type
}
import herd.convertx.api.component {
	Creator
}
import herd.convertx.api.operation {
	Delegator
}

shared abstract class ObjectPartializer<ThePartialization,Holder,Result>() satisfies Creator<Relation<Object,Result>,ThePartialization> given ThePartialization satisfies Partialization {
	shared actual ThePartialization create(Delegator delegator, Class<ThePartialization,Nothing> kind, Relation<Object,Result> arguments) {
		value sourceType=type(arguments.source);
		value attributes=sourceType.getAttributes<>().filter(filterObjectAndIdentifiableAttributes);
		value holder=mapAttributes(delegator,arguments.source,attributes);
		return createPartialization(holder);
	}
	shared formal Holder mapAttributes(Delegator delegator,Object source,{Attribute<>*} attributes);
	
	shared formal ThePartialization createPartialization(Holder holder);

	
	
}


