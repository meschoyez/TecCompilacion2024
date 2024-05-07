grammar compiladores;

@header {
package compiladores;
}


fragment LETRA : [A-Za-z] ;
fragment DIGITO : [0-9] ;

WS : [ \t\n\r] -> skip ;
// OTRO : . ;

PA : '(' ;
PC : ')' ;
LLA : '{' ;
LLC : '}' ;
PYC : ';' ;
IGUAL : '=' ;
SUMA : '+' ;
RESTA : '-' ;
MULT : '*' ;
DIV : '/' ;
MOD : '%' ;

INT : 'int' ;

NUMERO : DIGITO+ ;
ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

// si : s EOF ;

// s : PA s PC s
//   |
//   ;

// s : ID     { System.out.println("ID ->" + $ID.getText() + "<--"); }         s
//   | NUMERO { System.out.println("NUMERO ->" + $NUMERO.getText() + "<--"); } s
//   | OTRO   { System.out.println("Otro ->" + $OTRO.getText() + "<--"); }     s
//   | EOF
//   ;

programa : instrucciones EOF ;

instrucciones : instruccion instrucciones
              |
              ;

instruccion : LLA instrucciones LLC
            | declaracion
            | asignacion
            ;

declaracion : INT ID PYC ;

asignacion : ID IGUAL exp PYC ;

expresiones : exp PYC expresiones
            | EOF
            ;

exp : e ;

e : term t ;

term : factor f ;

t : SUMA  term t
  | RESTA term t
  |
  ;

factor : NUMERO
       | ID
       | PA exp PC
       ;

f : MULT factor f
  | DIV  factor f
  | MOD  factor f
  |
  ;