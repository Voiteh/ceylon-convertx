import herd.convertx.core.api.component {
	Creator,
	wired
}
import ceylon.language.meta.model {
	Type,
	Class,
	Attribute
}
import herd.convertx.core.api {
	Context
}

import ceylon.language.meta {
	type
}
import herd.convertx.core.util {
	filterObjectAndIdentifiableAttributes
}
import herd.convertx.core.api.meta.support {
	AttributePartialization
}
import ceylon.collection {
	HashMap
}
wired
shared class AttributePartializationCreator() satisfies Creator<AttributePartialization, Object->Type<Object>>{
	shared actual AttributePartialization create(Context context, Class<AttributePartialization,Nothing> kind, Object->Type<Object> arguments){
		assert(is Class<Object> clazz=arguments.item);
		value sourceType=type(arguments.key);
		value entries=clazz.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).map((Attribute<Nothing,Anything,Nothing> destAttribute) {
			value sourceAttribute = sourceType.getAttribute<>(destAttribute.declaration.name);
			value sourcePartValue=sourceAttribute?.bind(arguments.key)?.get();
			value destPartValue=context.convert(sourcePartValue,destAttribute.type);
			return destAttribute->destPartValue;
		});
		return AttributePartialization(HashMap<Attribute<>,Anything>{entries=entries;});
	}
	
	matcher => object satisfies AttributePartializationCreator.Matcher{
		shared actual Boolean match(Class<AttributePartialization,Nothing> kind, Object->Type<Object> arguments) => true;
		
		shared actual Integer priority => 0;
		
		
	};
}