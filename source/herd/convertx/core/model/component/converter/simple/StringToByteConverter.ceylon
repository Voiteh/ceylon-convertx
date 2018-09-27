
import herd.convertx.api {
	wired
}
import ceylon.language.meta.model {
	Type
}
import herd.convertx.api.component {
	Converter
}
import herd.convertx.api.operation {
	Delegator
}
wired
shared class StringToByteConverter() satisfies Converter<String,Byte> {
	shared actual Byte convert(Delegator delegator, String source, Type<Byte> resultType){
		value convert=delegator.convert(source,`Integer`);
		return convert.byte;
	}
	
	
}







