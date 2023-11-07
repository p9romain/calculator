{
  open Parser
}

let digit = ['0'-'9']
let decimals = '.' digit+

let integers = ( ['1'-'9'] digit+ ) | digit 

let exponent = ['e' 'E'] '-'? intergers
let floats = decimals | ( intergers decimals ) | ( intergers decimals? exponent )

rule scan_text = parse
| '+'                             { PLUS                      }
| '-'                             { MIN                       }
| '*'                             { TIMES                     }
| '/'                             { DIV                       }
| "//"                            { DIV_INT                   }
| '%'                             { MOD                       }
| '('                             { LPAR                      }
| ')'                             { RPAR                      }
| '^'                             { EXP                       }

| integers as n                   { INT ( int_of_string n )   }
| floats as f                     { FLOAT ( int_of_string f ) }

| eof                             { EOF                       }
| _                               { scan_text lexbuf          }