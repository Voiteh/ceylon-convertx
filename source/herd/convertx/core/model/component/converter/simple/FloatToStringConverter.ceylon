import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	Converter,
	wired
}
wired
shared class FloatToStringConverter() satisfies Converter<Float,String>  {
	shared actual String convert(Context context, Float source, Type<String> resultType) =>  source.string;
	
}