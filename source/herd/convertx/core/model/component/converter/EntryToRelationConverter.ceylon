
import ceylon.language.meta.model {
	ClassOrInterface,
	Type,
	Class
}
import herd.convertx.api.meta {
	Relation,
	ObjectRelation
}
import herd.convertx.api {
	wired
}
import ceylon.language.meta {
	type
}
import herd.convertx.api.operation {
	Convertion,
	Delegator
}
import herd.convertx.api.component {
	Converter
}

wired
shared class EntryToRelationConverter() satisfies Converter<Object->ClassOrInterface<>,Relation<>>{
	shared actual Relation<Anything,Anything> convert(Delegator delegator, Object->ClassOrInterface<Anything> source, Type<Relation<Anything,Anything>> resultType) {
			assert(exists classType=source.item.typeArgumentList.first);
			value clazz=`class ObjectRelation`.classApply<Relation<>>(type(source.key),classType);
			return clazz.apply(source.key,classType);
	}

	shared actual Convertion<Object->ClassOrInterface<Anything>,Relation<Anything,Anything>,Type<Relation<Anything,Anything>>>.Matcher? matcher => object satisfies Convertion<Object->ClassOrInterface<Anything>,Relation<Anything,Anything>,Type<Relation<Anything,Anything>>>.Matcher{
		
		shared actual Boolean match(Object->ClassOrInterface<Anything> source, Type<Relation<Anything,Anything>> resultType) =>  source.item is Class<>;
		
		shared actual Integer priority => 1;

	};
}
