type num =
| Int of int
| Float of float

type expr =
| Cst of num
| Add of expr * expr
| Dif of expr * expr
| Mul of expr * expr
| Div of expr * expr
| Div_int of expr * expr
| Mod of expr * expr
| Exp of expr * expr
| Min of expr

type prog = { calc : expr }