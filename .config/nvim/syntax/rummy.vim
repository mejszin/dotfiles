echom "Syntax code here"

syntax keyword Type dup drop swap rotate clear
syntax keyword Special add subtract mod equals gt lt ceil floor
syntax keyword Operator and or xor not
syntax keyword Repeat jmp jmpif return exit
syntax keyword Include include alias
syntax keyword Function print trace
syntax keyword Boolean true false
syntax match Comment "\v!"
syntax match Comment "\v#(.*)"
syntax match Number "\v\d"

let b:current_syntax = "rummy"
