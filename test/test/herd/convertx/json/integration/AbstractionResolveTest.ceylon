import ceylon.test {
	test,
	assertEquals
}
import test.herd.convertx.json.integration.data {
	TypeResolveInterface,
	testData,
	JsonObjectToTestResolveInterfaceResolver
}

import herd.convertx.core.api {
	Provider
}
import ceylon.collection {
	MutableList,
	ArrayList
}
import herd.convertx.core.api.component {
	Component
}
import ceylon.json {
	JsonObject
}
shared class AbstractionResolveTest() extends BaseJsonIntegrationTest(){
	
	object resolvingProvider satisfies Provider{
		shared actual MutableList<Component> components = ArrayList<Component>{
			elements = {
				JsonObjectToTestResolveInterfaceResolver()
			};
	};
		
		
	}
	
	shared actual {Provider*} additionalProviders => super.additionalProviders.follow(resolvingProvider);
	
	shared test
	void shouldConvertTypeResolveOneIntoJsonObject(){
		value result=convertx.convert(testData.resolveOne,`JsonObject`);
		assertEquals(result,testData.resolveOneJsonObject);
	}
	
	shared test
	void shouldConvertTypeResolveTwoIntoJsonObject(){
		value result=convertx.convert(testData.resolveTwo,`JsonObject`);
		assertEquals(result,testData.resolveTwoJsonObject);
	}
	
	shared test
	void shouldConvertJsonObjectIntoTypeResolveOne(){
		value result=convertx.convert(testData.resolveOneJsonObject,`TypeResolveInterface`);
		assertEquals(result,testData.resolveOne);
	}
	
	shared test
	void shouldConvertJsonObjectIntoTypeResolveTwo(){
		value result=convertx.convert(testData.resolveTwoJsonObject,`TypeResolveInterface`);
		assertEquals(result,testData.resolveTwo);
	}
	
	
	
}