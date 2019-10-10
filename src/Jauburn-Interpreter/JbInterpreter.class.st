"
I am an interpreter for programs written in the Jauburn language.  My principle API methods are:

	interpret: anAST -- given an abstract syntax tree, interpret it
	run: aString -- parse and interpret the supplied string
"
Class {
	#name : #JbInterpreter,
	#superclass : #Object,
	#instVars : [
		'environment'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #primitives }
JbInterpreter >> absBinding [

	^ #abs -> [ :a | a abs]
]

{ #category : #primitives }
JbInterpreter >> concatBinding [

	^ #concat -> [ :a :b | (a + b) asString]
]

{ #category : #accessing }
JbInterpreter >> environment [ 

	^environment
]

{ #category : #evaluating }
JbInterpreter >> evalFunction: fn in: anEnvironment [ 

	^JbFunction new 
	parameters: fn second;
	body: fn third;
	environment: anEnvironment.
]

{ #category : #initialization }
JbInterpreter >> initialize [ 

	super initialize.
	environment := JbEnvironment new.
	
	(self class selectors select: [ :each | each endsWith: 'Binding' ])
		do: [ :s | 
				| binding |
				binding := self perform: s.
				environment at: binding key put: binding value ]
]

{ #category : #primitives }
JbInterpreter >> inputBinding [
	
	"input primitive"
	
	^ #input -> [ :a :b | (a + b) asString]
]

{ #category : #api }
JbInterpreter >> interpret: ast [

	^ast executeIn: environment 
]

{ #category : #primitives }
JbInterpreter >> lengthBinding [

	^ #length -> [ :a | a size]
]

{ #category : #primitives }
JbInterpreter >> modBinding [

	^ #mod -> [ :a :b | a \\ b]
]

{ #category : #primitives }
JbInterpreter >> notBinding [

	^ #not -> [ :a | a not]
]

{ #category : #primitives }
JbInterpreter >> printBinding [
	
	"print primitive from pdf"
	
	^ #print -> [ :value | Transcript show: value printString]
]

{ #category : #api }
JbInterpreter >> run: programString [

	| parser |
	parser := JbParser new.
	self interpret: (parser parse: programString)
]

{ #category : #'as yet unclassified' }
JbInterpreter >> transcript [ 

	^ transcript ifNil: [ Transcript ]  
]
