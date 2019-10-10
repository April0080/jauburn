Extension { #name : #JbVariableDeclarationStatementNode }

{ #category : #'*Jauburn-Interpreter' }
JbVariableDeclarationStatementNode >> executeIn: environment [

	"sets the identifier to the expression after its been evaluated in"

	environment at: self identifier put: (self expression evaluateIn: environment)
]
