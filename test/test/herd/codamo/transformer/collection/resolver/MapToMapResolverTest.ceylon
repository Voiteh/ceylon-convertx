
import ceylon.test {
	test
}
import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class
}


import herd.codamo.api.core.transformer {
	Delegator
}

import herd.codamo.transformer.collection.resolver {
	MapToMapResolver
}

shared class MapToMapResolverTest() {
	
	
	value mapResolver=MapToMapResolver();
	
	shared test 
	void shouldResolveToHashMap(){
		Delegator delegator=MockDelagator();
		assert(is Class<HashMap<String,Integer>> resolved=mapResolver.resolve(delegator,HashMap<Integer,String>(),`Map<String,Integer>`));
	}
	
	
	
	
	
	
	
	
	
	
	
}