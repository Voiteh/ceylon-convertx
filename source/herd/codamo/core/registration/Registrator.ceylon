import herd.codamo.api.operation {
	Operation
}

"Registrator interface allows registereing of [[Operation]]s"
shared interface Registrator {
	
	shared formal void register(Operation.Flatter visitor,Registry registry,Operation[] operations);
	
}