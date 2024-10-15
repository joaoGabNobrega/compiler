grammar CSubset;

// Regras Léxicas (Tokens)
fragment DIGIT : [0-9] ;
fragment LETTER : [a-zA-Z] ;

ID : LETTER (LETTER | DIGIT)* ;        // Identificadores
INT : DIGIT+ ;                         // Inteiros
FLOAT : DIGIT+ '.' DIGIT* ;            // Floats
CHAR : '\'' . '\'' ;                   // Caracteres
WS : [ \t\r\n]+ -> skip ;              // Espaços em branco

// Operadores
PLUS : '+' ;
MINUS : '-' ;
MULT : '*' ;
DIV : '/' ;
MOD : '%' ;

ASSIGN : '=' ;
EQ : '==' ;
NEQ : '!=' ;
LT : '<' ;
LE : '<=' ;
GT : '>' ;
GE : '>=' ;

// Pontuação
LPAREN : '(' ;
RPAREN : ')' ;
LBRACE : '{' ;
RBRACE : '}' ;
SEMI : ';' ;
COMMA : ',' ;

// Regras Sintáticas
prog : (decl | stmt)* ;

decl : type ID (ASSIGN expr)? SEMI ;

stmt : (exprStmt | ifStmt | whileStmt) ;

exprStmt : expr SEMI ;

ifStmt : 'if' LPAREN expr RPAREN stmt ('else' stmt)? ;

whileStmt : 'while' LPAREN expr RPAREN stmt ;

expr : expr (PLUS | MINUS | MULT | DIV | MOD) expr
     | ID
     | INT
     | FLOAT
     | LPAREN expr RPAREN
     ;

type : 'int' | 'float' | 'char' ;
