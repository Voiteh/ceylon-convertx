import ceylon.test {
	test,
	assertEquals
}
import ceylon.language.meta {
	type
}
shared class SelfTest() extends CoreIntegration() {
	
	shared test  
	void shouldConvertIntegerToInteger(){
		 	value result = gecon.convert(4, `Integer`);
		 	assertEquals(result,4);
	}
	
	shared test  
	void shouldConvertEnumToEnum(){
		value result = gecon.convert(one, `EnumTwo`);
		assertEquals(result,one);
	}
	
	shared test
	void shouldConvertSimpleModelToSimpleModel(){
		value model=TestSimpleModel(1,"bla");
		value result=gecon.convert(model, `TestSimpleModel`);
		assertEquals(result,model);
	}
	
	shared test
	void shouldConvertIterableToIterable(){
		value stream={1,2,3};
		value result=gecon.convert(stream, type(stream));
		assertEquals(result,stream);
	}
}