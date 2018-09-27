
import herd.convertx.json.model.meta {
	JsonPartialization
}
import ceylon.language.meta.model {
	Attribute,
	Class
}
import herd.convertx.api {
	wired
}
import herd.convertx.api.meta {
	Relation
}
import ceylon.json {
	Value,
	JsonObject
}
import herd.convertx.api.meta.component {
	ObjectPartializer
}
import herd.convertx.api.operation {
	Creation,
	Delegator
}

shared wired class ObjectJSONPartializer() extends ObjectPartializer<JsonPartialization, {<String->Value>*}, JsonObject>(){
	shared actual JsonPartialization createPartialization({<String->Value>*} holder) => JsonPartialization(holder);
	
	shared actual {<String->Value>*} mapAttributes(Delegator delegator,Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.map((Attribute<> element) {
		value val=element.bind(source).get();
		if(is Value val ){
			return element.declaration.name->val;
		}
		else{
			return element.declaration.name->delegator.convert(val, `Value`);
		}
	});
	
	shared actual Creation<Relation<Object,JsonObject>,JsonPartialization,JsonPartialization>.Matcher? matcher => object satisfies Creation<Relation<Object,JsonObject>,JsonPartialization,JsonPartialization>.Matcher{
		shared actual Boolean match(Class<JsonPartialization,Nothing> kind, Relation<Object,JsonObject> arguments) => true;
		
		shared actual Integer priority => 2;
		
	};
		
}

