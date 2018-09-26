import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	Context,
	Converter,
	wired
}

wired
shared class CharacterToStringConverter() satisfies Converter<Character,String>  {
	shared actual String convert(Context context, Character source, Type<String> resultType) =>  source.string;
	
}