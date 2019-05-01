import herd.codamo.api.core.transformer {
	Mapper,
	Relation
}
import herd.codamo.api.core.dictionary {
	AttributeDictionary
}
import ceylon.language.meta.model {
	Attribute,
	Class
}
import herd.codamo.api.core.util {
	filterObjectAndIdentifiableAttributes
}
shared class ResultAttributeMapper() extends Mapper
<{<String->Anything>*},Object,AttributeDictionary>
(){
	shared actual AttributeDictionary map(Relation<{<String->Anything>*},Object> relation) {
		value mapping=relation.resultClass.getAttributes<>()
				.filter(filterObjectAndIdentifiableAttributes)
				.tabulate((Attribute<Nothing,Anything,Nothing> key) => relation.source.find((String elementKey -> Anything elementItem) => key.declaration.name==elementKey)?.item);
	return AttributeDictionary(mapping);
	}
	
	shared actual Matcher matcher => Matcher{ 
		 predicate(Relation<{<String->Anything>*},Object> relation, Class<AttributeDictionary,Nothing> resultType) => true;
		 priority =1;
	};
	
	
}