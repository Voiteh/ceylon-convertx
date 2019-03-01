

import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	Delegator
}

"Converts [[Boolean]] type value into [[String]]. 
 
 Possible corelations source -> result:
 
 true -> \"true\"
 
 false -> \"false\"
 "
tagged("Basic")
by("Wojciech Potiopa")
shared class BooleanToStringConverter() extends Converter<Boolean,String>()  {
	shared actual String convert(Delegator delegator, Boolean source, Type<String> resultType) =>  source.string;
	
}
