

import ceylon.language.meta.model {
	Class
}
import ceylon.json {
	JsonArray,
	Value
}
import herd.codamo.api.operation {
	Creation,
	Delegator,
	wired
}
import herd.codamo.api.component {
	Creator
}


shared wired class JsonArrayCreator() satisfies Creator<{Value*},JsonArray> {
	shared actual JsonArray create(Delegator delegator, Class<JsonArray,Nothing> kind, {Value*} arguments) => JsonArray(arguments);
	

	shared actual Creation<{Value*},JsonArray,JsonArray>.Matcher? matcher => object satisfies Creation<{Value*},JsonArray,JsonArray>.Matcher{
		shared actual Boolean match(Class<JsonArray,Nothing> kind, {Value*} arguments) => true;
		
		shared actual Integer priority => 1;
	};
		
}