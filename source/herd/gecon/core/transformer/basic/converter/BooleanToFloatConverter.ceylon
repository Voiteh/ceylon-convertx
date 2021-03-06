import ceylon.language.meta.model {
	Type
}

import herd.gecon.core.api.transformer {
	Converter,
	Delegator
}

"Converts provied [[Boolean]] value into [[Float]] type. 
 
 Possible corelations, source -> result:
 
 true -> 1.0
 
 false -> 0.0 "
tagged("Basic")
by("Wojciech Potiopa")
shared class BooleanToFloatConverter() extends Converter<Boolean,Float,Type<Float>>()  {
	shared actual Float convert(Delegator delegator, Boolean source, Type<Float> resultType) {
		switch(source)
		case (true) { return 1.0;}
		case (false) {return 0.0; }
	}
	
	
}