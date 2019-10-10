"
function node class
"
Class {
	#name : #JbFunctionNode,
	#superclass : #Object,
	#instVars : [
		'name',
		'body',
		'parameters'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbFunctionNode >> body [
	^ body
]

{ #category : #accessing }
JbFunctionNode >> body: anObject [
	body := anObject
]

{ #category : #api }
JbFunctionNode >> call: args in: environment [

	"creates an environment with parameters bound and evluated the body in that environment"

	^args evaluateIn: environment	
	
	
]

{ #category : #api }
JbFunctionNode >> evaluateIn: environment [ 
	"execute method"
	^JbFunction new
	parameters: self parameters;
	body: self body;
	environment: environment;
	yourself.
]

{ #category : #api }
JbFunctionNode >> executeIn: environment [ 
	"execute method"
	^JbFunction new
	parameters: self parameters;
	body: self body;
	environment: environment;
	yourself.
]

{ #category : #accessing }
JbFunctionNode >> name [
	^ name
]

{ #category : #accessing }
JbFunctionNode >> name: anObject [
	name := anObject
]

{ #category : #accessing }
JbFunctionNode >> parameters [
	^ parameters
]

{ #category : #accessing }
JbFunctionNode >> parameters: anObject [
	parameters := anObject
]
