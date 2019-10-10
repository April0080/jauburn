"
class allows us to reassign values to existing identifiers
"
Class {
	#name : #JbAssignmentStatementNode,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'expression'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #api }
JbAssignmentStatementNode >> evaluateIn:  environment [ 
	
		| value |
		value := self expression evaluateIn: environment.
		self operator = $-
		ifTrue: [ ^ (0 - value) ].
	
		^value "(environment at: expression)"
]

{ #category : #api }
JbAssignmentStatementNode >> executeIn: environment [ 
	
	"assigns a new value to an existing identifier"
	
	environment at: self identifier put: (self expression evaluateIn: environment)
]

{ #category : #accessing }
JbAssignmentStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
JbAssignmentStatementNode >> expression: anObject [
	expression := anObject
]

{ #category : #accessing }
JbAssignmentStatementNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbAssignmentStatementNode >> identifier: anObject [
	identifier := anObject
]
