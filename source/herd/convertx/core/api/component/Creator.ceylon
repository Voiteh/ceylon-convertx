import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.internal {
	Executable,
	Findable
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta {
	type,
	typeLiteral
}

shared sealed interface TypedCreator<in Args=Nothing,out Result=Anything, in Kind=Nothing> satisfies Component given Kind satisfies Result {
	
	throws (`class ConvertionException`)
	shared formal Result create(Context context,Class<Kind> kind, Args arguments);
	
	
	
	shared interface Matcher {
		shared formal Boolean match(Class<Kind> kind, Args arguments);
		shared formal Integer priority;
	}
	
	shared default Matcher? matcher => null;
}
shared interface Creator<Args,Result > satisfies  TypedCreator<Args,Result,Result> {
	
	throws (`class ConvertionException`)
	shared formal actual Result create(Context context,Class<Result> kind, Args arguments);


	shared actual Executable toExecutable(Executable.Adapter visitor) => visitor.adaptCreator(this);
	shared actual Findable toFindable(Findable.Adapter visitor) => visitor.adaptCreator(this);
	
	
	string => "``type(this).declaration.name``, Args type: ``typeLiteral<Args>()``, Result type: ``typeLiteral<Result>()``"; 
}
