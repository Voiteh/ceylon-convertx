"Whenever there is error one of subtypes will be thrown"
by("Wojciech Potiopa")
shared abstract class TransformationError(String message, Throwable? cause = null) 
		of Conversion<>.Error|  Resolvance<>.Error| Creation<>.Error |Mapping<>.Error
		extends Exception(message, cause){}