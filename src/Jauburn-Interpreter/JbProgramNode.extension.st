Extension { #name : #JbProgramNode }

{ #category : #'*Jauburn-Interpreter' }
JbProgramNode >> executeIn: environment [
	
	"executes each statement"

	statements do: [ :each | each executeIn: environment ]
]
