import ceylon.test {
	test,
	assertEquals
}
import herd.codamo.core.component.resolver {
	KeyToValueMappingResolver
}
import ceylon.collection {
	HashMap
}
import herd.codamo.api.meta {
	Mapping,
	Relation
}
import ceylon.language.meta.model {
	Class
}

class TestModel(id,name){
	Integer id;
	String name;
}

shared class KeyToValueMappingResolverTest() {
	
	KeyToValueMappingResolver resolver = KeyToValueMappingResolver();
	
	shared test 
	void shouldMatchToEntryMappingResolver(){
		assert(exists matcher=resolver.matcher);
		value model=TestModel(1,"ble");
		object relation satisfies Relation<TestModel,HashMap<String,Anything>>{
			shared actual Class<HashMap<String,Anything>,Nothing> resultClass => `HashMap<String,Anything>`;
			
			shared actual TestModel source => model;
			
			
		}
		value result=matcher.match(relation, `Mapping`);
		assertEquals(result,true);
	}
	
	
	
	
}