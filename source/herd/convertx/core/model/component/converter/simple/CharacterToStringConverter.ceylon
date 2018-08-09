import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	Converter,
	Component
}
service(`interface Component`)
shared class CharacterToStringConverter() satisfies Converter<Character,String>  {
	shared actual String convert(Context context, Character source, Type<String> resultType) =>  source.string;
	
}