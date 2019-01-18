import ceylon.collection {
	LinkedList
}

import ceylon.language.meta.model {
	Class
}


import herd.codamo.api.core.transformer {
	Creator,
	provided,
	Creation,
	Delegator
}
"Creator for [[LinkedList]] using any iterable as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared provided class LinkedListCreator() satisfies Creator<{Anything*},List<Anything>> {
	shared actual List<Anything> create(Delegator delegator,Class<List<Anything>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(arguments);
	}
	
	shared actual Creation<{Anything*},List<Anything>,List<Anything>>.Matcher? matcher => object satisfies Creation<{Anything*},List<Anything>,List<Anything>>.Matcher{
		shared actual Boolean match(Class<List<Anything>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class LinkedList`;
		}
		
		shared actual Integer priority => 1;	
	};
}