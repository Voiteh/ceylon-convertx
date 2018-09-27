import ceylon.language.meta.model {
	Type
}

import herd.convertx.api {
	wired
}
import herd.convertx.api.operation {
	ConvertionError,
	Delegator
}
import herd.convertx.api.component {
	Converter
}
wired
shared class StringToIntegerConverter() satisfies Converter<String,Integer>  {
	shared actual Integer convert(Delegator delegator, String source, Type<Integer> resultType) {
		value parse = Integer.parse(source);
		switch (parse)
		case (is Integer) {
			return parse;
		}
		case (is ParseException) {
			throw ConvertionError(source, resultType, parse);
		}
	}
	
}