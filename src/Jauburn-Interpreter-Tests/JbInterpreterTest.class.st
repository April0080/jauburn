Class {
	#name : #JbInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #utilities }
JbInterpreterTest >> interpret: aString [

	| ast |
	ast :=  parser parse: aString.
	^interpreter interpret: ast.
	
]

{ #category : #running }
JbInterpreterTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #tests }
JbInterpreterTest >> testAbsBinding [

	"tests abs"
	
	self interpret: 'var x = 5; var y = abs(x);'.
	self assert: (interpreter environment at: 'y') equals: 5.
	
	self interpret: 'var x = -6; var y = abs(x);'.
	self assert: (interpreter environment at: 'y') equals: 6.
]

{ #category : #tests }
JbInterpreterTest >> testAssignmentStatementNode [

	"does not work. need to test inside block for return statement"

	self interpret: 'var x = 3; x = x + 2;'.
	self assert: (interpreter environment at: 'x') equals: 5.
]

{ #category : #tests }
JbInterpreterTest >> testBoolean [ 

	"tests true and false"
	
	self interpret: 'var x = true;'.
	self assert: (interpreter environment at: 'x') equals: true.
	self interpret: 'var x = false;'.
	self assert: (interpreter environment at: 'x') equals: false.
]

{ #category : #tests }
JbInterpreterTest >> testBooleanValues [

	self interpret: '7 > 6;'.
	self assert: (interpreter environment at: '>') equals: true.
	
]

{ #category : #tests }
JbInterpreterTest >> testConcatBinding [

	"tests concat"
	
	self interpret: 'var x = "hello "; var y = "world"; var z = concat(x, y)'.
	self assert: (interpreter environment at: 'z') equals: 'hello world'.
	
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	"all tests work"
	
	"tests + and *"
	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.
	
	"tests - and /"
	self interpret: 'var x = 15 - 8 / 4;'.
	self assert: (interpreter environment at: 'x') equals: 13.
	
	"tests * with variable"
	self interpret: 'var x = 6;var y = 2*x;'.
	self assert: (interpreter environment at: 'y') equals: 12.
	
	"tests negative"
	self interpret: 'var x = 6;var y = -x;'.
	self assert: (interpreter environment at: 'y') equals: -6.
	
	"tests =="
	self interpret: 'var x = 3; var y = 3; var w = x == y;'.
	self assert: (interpreter environment at: 'w') equals: true.
	
	"tests =="
	self interpret: 'var x = 3; var y = 5; var w = x == y;'.
	self assert: (interpreter environment at: 'w') equals: false.
	
	
	"tests <="
	self interpret: 'var x = 3; var y = 3; var w = x <= y;'.
	self assert: (interpreter environment at: 'w') equals: true.
	
	"tests <="
	self interpret: 'var x = 3; var y = 4; var w = x <= y;'.
	self assert: (interpreter environment at: 'w') equals: true.
	
	"tests <="
	self interpret: 'var x = 3; var y = 2; var w = x <= y;'.
	self assert: (interpreter environment at: 'w') equals: false.
	
	"tests <"
	self interpret: 'var x = 3; var y = 3; var w = x < y;'.
	self assert: (interpreter environment at: 'w') equals: false.
	
	"tests <"
	self interpret: 'var x = 3; var y = 4; var w = x < y;'.
	self assert: (interpreter environment at: 'w') equals: true.
	
	"tests <"
	self interpret: 'var x = 3; var y = 2; var w = x < y;'.
	self assert: (interpreter environment at: 'w') equals: false.
	
	"tests >="
	self interpret: 'var x = 3; var y = 3; var w = x >= y;'.
	self assert: (interpreter environment at: 'w') equals: true.
	
	"tests >="
	self interpret: 'var x = 3; var y = 4; var w = x >= y;'.
	self assert: (interpreter environment at: 'w') equals: false.
	
	"tests >="
	self interpret: 'var x = 3; var y = 2; var w = x >= y;'.
	self assert: (interpreter environment at: 'w') equals: true.
	
	"tests >"
	self interpret: 'var x = 3; var y = 3; var w = x > y;'.
	self assert: (interpreter environment at: 'w') equals: false.
	
	"tests >"
	self interpret: 'var x = 3; var y = 4; var w = x > y;'.
	self assert: (interpreter environment at: 'w') equals: false.
	
	"tests >"
	self interpret: 'var x = 3; var y = 2; var w = x > y;'.
	self assert: (interpreter environment at: 'w') equals: true.
	
	"tests !="
	self interpret: 'var x = 4; var y = 5; var w = x != y;'.
	self assert: (interpreter environment at: 'w') equals: true.
	
	"tests !="
	self interpret: 'var x = 4; var y = 4; var w = x != y;'.
	self assert: (interpreter environment at: 'w') equals: false.
	
	
	
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	"tests that a variable can be set to a value"

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]

{ #category : #tests }
JbInterpreterTest >> testFunctionCall [

	self interpret: 'var x = function(a, b) {return a + b;}; var y = x(1, 2);'.
	self assert: (interpreter environment at: 'y') equals: 3.
	
]

{ #category : #tests }
JbInterpreterTest >> testFunctionDefinition [

	"testing function definition - works"

	self interpret: 'var x = function(a, b) {};'.
	self assert: (interpreter environment at: 'x') parameters size equals: 2.
	self assert: (interpreter environment at: 'x') body size equals: 0.
	self assert: (interpreter environment at: 'x') environment equals: interpreter environment.
]

{ #category : #'as yet unclassified' }
JbInterpreterTest >> testIfElseFunctions [
	
	"tests if an ifElse function is evaluated"
	
	self interpret: 'var x = 1; if (x < 2) {var y = x + 1;}'.
	self assert: (interpreter environment at: 'y') equals: 2.
	
	self interpret: 'var x = 2; if (x < 2) {var y = x + 1;} else {var y = 12;}'.
	self assert: (interpreter environment at: 'y') equals: 12.
	

]

{ #category : #tests }
JbInterpreterTest >> testIfFunction [

	"Tests if function"
		
	self interpret: 'var x = 2; if (x < 3) {return x = 4;};'.
	self assert: (interpreter environment at: 'x') equals: 4.

	self interpret: 'var x = 5; if (x < 3) {return x = 4;};'.
	self assert: (interpreter environment at: 'x') equals: 2.	
]

{ #category : #tests }
JbInterpreterTest >> testIfFunctions [
	
	"tests if an if function is evaluated"
	
	self interpret: 'var x = 1; if (x < 2) {x = 2;}'.
	self assert: (interpreter environment at: 'x') equals: 2.
	

	self interpret: 'var x = 1; if (x < 1) {x = 2;}'.
	self assert: (interpreter environment at: 'x') equals: 1.
	
	
]

{ #category : #tests }
JbInterpreterTest >> testLengthBinding [

	"tests length"
	
	self interpret: 'var x = length("hello");'.
	self assert: (interpreter environment at: 'x') equals: 5.
	
]

{ #category : #tests }
JbInterpreterTest >> testModBinding [

	"tests mod"
	
	self interpret: 'var x = 8; var y = 3; var m = mod(8, 3);'.
	self assert: (interpreter environment at: 'm') equals: 2.
	
]

{ #category : #tests }
JbInterpreterTest >> testNotBinding [

	"tests not"
	
	self interpret: 'var x = true; var y = not(x);'.
	self assert: (interpreter environment at: 'y') equals: false.
	
	self interpret: 'var x = false; var y = not(x);'.
	self assert: (interpreter environment at: 'y') equals: true.
]

{ #category : #'as yet unclassified' }
JbInterpreterTest >> testWhileFunctions [
	
	"tests if an while function is evaluated"
	
	self interpret: 'var x = 1; while (x < 2) {var y = x + 1; var x = 2;}'.
	self assert: (interpreter environment at: 'y') equals: 2.
	
]
