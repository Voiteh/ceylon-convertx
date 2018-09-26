import ceylon.language.meta.model {
	Type
}

import herd.convertx.api {
	Context,
	Converter,
	ConvertionException,
	wired
}
wired
shared class StringToCharacterConverter() satisfies Converter<String,Character> {
	shared actual Character convert(Context context, String source, Type<Character> resultType) {
		if (exists char = source.first) {
			return char;
		}
		throw ConvertionException(source, resultType, Exception("Can't convert empty string to Character"));
	}
	
}