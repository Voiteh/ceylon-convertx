import ceylon.language.meta.model {
	Class,
	Interface,
	Type
}
import ceylon.collection {
	HashSet
}
import herd.convertx.core.api.component {
	wired,
	Resolver
}
import herd.convertx.core.api {
	Context
}

shared wired class IterableToSetResolver() satisfies Resolver<Set<>,{Anything*}>{
	
	shared actual Class<Set<>> resolve(Context context,{Anything*} input,Type<Set<>> outputType) { 
		assert(is Interface<Set<>> outputType);
		value typeForIterable = iterableTypeArgument(outputType);
		return `class HashSet`.classApply<Set<>>(typeForIterable);
	}		
	
	matcher => object satisfies IterableToSetResolver.Matcher{
		shared actual Integer priority => 1;
		shared actual Boolean match({Anything*} input, Type<Set<>> outputType) => outputType is Interface<Set<>>;
		
		
		
		
	};
	
	
	
}