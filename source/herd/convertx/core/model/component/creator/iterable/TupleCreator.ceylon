import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api.component {
	Creator,
	Component
}

service(`interface Component`)
shared class TupleCreator() satisfies  Creator<Tuple<Anything,Anything,Anything>,{Anything*}> {
	shared actual Tuple<Anything,Anything,Anything> create(Class<Tuple<Anything,Anything,Anything>,Nothing> kind, {Anything*} arguments) {
		value first = arguments.first;
		assert (exists elementType = kind.typeArgumentList.first);
		if (arguments.rest.empty) {
			return kind.apply(first, empty);
		} else {
			assert (is Class<Tuple<Anything,Anything,Anything>> subTupleType = kind.typeArgumentList.rest.rest.first);
			value subTuple = create(subTupleType, arguments.rest);
			return kind.apply(first, subTuple);
		}
	}
	matcher => object satisfies Creator<Tuple<Anything,Anything,Anything>,{Anything*}>.Matcher {
		shared actual Boolean match(Class<Tuple<Anything,Anything,Anything>,Nothing> kind, {Anything*} arguments) => true;
		
		shared actual Integer priority => 1;
	};
}
