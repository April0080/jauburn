Extension { #name : #JbArity2OperatorNode }

{ #category : #'*Jauburn-Interpreter' }
JbArity2OperatorNode >> evaluateIn: environment [

	"all math operations"

	| lhsValue rhsValue |
	lhsValue := self lhs evaluateIn: environment.
	rhsValue := self rhs evaluateIn: environment.
	self operator = $*
		ifTrue: [ ^lhsValue * rhsValue ].
	self operator = $+
		ifTrue: [ ^lhsValue + rhsValue ].
	self operator = $-
		ifTrue: [ ^lhsValue - rhsValue ].
	self operator = $/
		ifTrue: [ ^lhsValue / rhsValue ].
	self operator = '<'
		ifTrue: [ ^lhsValue < rhsValue ].
	self operator = '>'
		ifTrue: [ ^lhsValue > rhsValue ].
	self operator = '>='
		ifTrue: [ ^lhsValue >= rhsValue ].
	self operator = '<='
		ifTrue: [ ^lhsValue <= rhsValue ].
	self operator = '!='
		ifTrue: [ ^lhsValue ~= rhsValue ].
	self operator = '=='
		ifTrue: [ ^lhsValue == rhsValue ].
	
	
	
	
	
	
	
]
