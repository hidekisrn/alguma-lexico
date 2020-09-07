lexer grammar AlgumaLexer;

@lexer::members {void erro(String msg) { throw new ParseCancellationException(msg); }}

COMENTARIOS : '{' ~('}' | '{' )* '}' -> skip;

ALGORITMO: 'algoritmo';
   
DECL: 'declare';

TIPO: 'tipo';

VAR: 'var';

CONSTANTE: 'constante';

LOGICO: 'logico';

LITERAL: 'literal';

INTEIRO: 'inteiro';

REGISTRO: 'registro';

FIMREGISTRO: 'fim_registro';

PROCEDIMENTO: 'procedimento';

FIMPROCEDIMENTO: 'fim_procedimento';

FUNCAO: 'funcao';

RETORNE: 'retorne';

FIMFUNCAO: 'fim_funcao';

FALSO: 'falso';

NAO: 'nao';

VERDADEIRO: 'verdadeiro';

REAL: 'real';

LER: 'leia';

ESCREVER: 'escreva';

ENTAO: 'entao';

OU: 'ou';

E: 'e';

SE: 'se';

FIMSE: 'fim_se';

SENAO: 'senao';

FACA: 'faca';

ENQUANTO: 'enquanto';

FIMENQUANTO: 'fim_enquanto';

PARA: 'para';

FIMPARA: 'fim_para';

ATE: 'ate';

SEJA: 'seja';

FIMCASO: 'fim_caso';

FIMALGORITMO: 'fim_algoritmo';

ATRIBUI: '<-';

SOMA: '+';

MENOS: '-';

MULT: '*';

DIV: '/';

MODULO: '%';

PONTEIRO: '^';

ENDERECO: '&';

IGUAL: '=';

DIFERENTE: '<>';

MENOR: '<';

MENORIGUAL: '<=';

MAIOR: '>';

MAIORIGUAL: '>=';

NUM_INT: ('+'|'-')?('0'..'9')+;

NUM_REAL: ('+'|'-')?('0'..'9')+ ('.' ('0'..'9')+)?;

IDENT : ( 'a'..'z' | 'A'..'Z' | '_' ) ( 'a'..'z' | 'A'..'Z' | '0'..'9' | '_' )* ;

CADEIA : '"' ~('\n')*? '"';
 
WS : ( ' ' | '\t' | '\r' | '\n' ) {skip();} ;

DELIM	: ':';

ABREPAR : '(';

FECHAPAR: ')';

ABRECOLCHETES: '[';

FECHACOLCHETES: ']';

VIRG: ',';

PONTO: '.';

ERRO_CADEIA: '"' .*? {erro("Linha " + (getLine()) + ": cadeia literal nao fechada");};

ERRO_COMENTARIO:   '{' .*? {erro("Linha " + (getLine()) + ": comentario nao fechado");};

ERRO_SIMBOLO: . {erro("Linha " + getLine() + ": " + getText() + " - simbolo nao identificado");};

