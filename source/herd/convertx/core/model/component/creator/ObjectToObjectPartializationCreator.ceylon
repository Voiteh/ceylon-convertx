
import ceylon.language.meta.model {
	Type,
	Class,
	Attribute
}
import herd.convertx.api {
	Context,
	Creator,
	wired
}

import ceylon.language.meta {
	type
}

import ceylon.collection {
	HashMap
}


import herd.convertx.api.meta {
	AttributePartialization,
	filterObjectAndIdentifiableAttributes
}
wired
shared class ObjectToObjectPartializationCreator() satisfies Creator<Object->Type<Object>,AttributePartialization>{
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
	
	matcher => object satisfies ObjectToObjectPartializationCreator.Matcher{
		shared actual Boolean match(Class<AttributePartialization,Nothing> kind, Object->Type<Object> arguments) => true;
		
		shared actual Integer priority => 0;
		
		
	};
}