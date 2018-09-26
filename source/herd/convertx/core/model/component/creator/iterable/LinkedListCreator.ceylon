import ceylon.collection {
	LinkedList
}

import ceylon.language.meta.model {
	Class
}
import herd.convertx.api {
	Context,
	Creator,
	wired
}
wired
shared class LinkedListCreator() satisfies Creator<{Anything*},List<Anything>> {
	shared actual List<Anything> create(Context context,Class<List<Anything>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(arguments);
	}
	matcher => object satisfies LinkedListCreator.Matcher {
		shared actual Boolean match(Class<List<Anything>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class LinkedList`;
		}
		
		shared actual Integer priority => 1;
	};
}