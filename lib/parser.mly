%{
  open Ast
%}

%token PLUS
%token MIN
%token TIMES
%token DIV
%token DIV_INT
%token MOD
%token EXP

%token LPAR
%token RPAR

%token <int> INT
%token <float> FLOAT

%token EOF

%type <prog> prog
%type <expr> expr
%start prog

%%

prog:
| expr EOF { { calc = $1 } }
;

expr:
| e1=expr PLUS e2=expr      { Add(e1, e2) }
| e1=expr MIN e2=expr       { Dif(e1, e2) }
| e1=expr TIMES e2=expr     { Mul(e1, e2) }
| e1=expr DIV e2=expr       { Div(e1, e2) }
| e1=expr DIV_INT e2=expr   { Div_int(e1, e2) }
| e1=expr MOD e2=expr       { Mod(e1, e2) }
| e1=expr EXP e2=expr       { Exp(e1, e2) }

| MIN e=expr                { Min(e) } 

| LPAR e=expr RPAR          { e }

| n=INT                     { Cst( Int(n) ) }
| f=FLOAT                   { Cst( Float(f) ) }
;

%%