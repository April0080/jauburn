"
while node class
"
Class {
	#name : #JbWhileNode,
	#superclass : #Object,
	#instVars : [
		'condition',
		'trueStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbWhileNode >> condition [
	^ condition
]

{ #category : #accessing }
JbWhileNode >> condition: anObject [
	condition := anObject
]

{ #category : #api }
JbWhileNode >> executeIn: anEnvironment [

	(condition evaluateIn: anEnvironment) ifTrue: [ :each | each trueStatements]
]

{ #category : #accessing }
JbWhileNode >> trueStatements [
	^ trueStatements
]

{ #category : #accessing }
JbWhileNode >> trueStatements: anObject [
	trueStatements := anObject
]
