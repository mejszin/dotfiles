" Deque (lucius=#93d6a9)
syntax keyword Type dup drop swap rotate clear length
" Mathematical (lucius=#cca3b3)
syntax keyword Special add subtract mod equals gt lt ceil floor
" Check (lucius=#c0e0b0)
syntax keyword Directory number?
" String (lucius=#80c0d9)
syntax keyword String upcase downcase concat chr ord
" Boolean operators (lucius=#b3d38c)
syntax keyword Operator and or xor not
" Pointer (lucius=#b3d38c)
syntax keyword Repeat jmp jmpif return exit
" Include / Input (lucius=#f0dfaf)
syntax keyword Include include alias input run
" Output (lucius=#efaf7f)
syntax keyword Function print trace inspect
" Boolean (lucius=#8cd0d3)
syntax keyword Boolean true false
" Direction (lucius=#606060)
syntax match Comment "\v!"
" Comment (lucius=#606060)
syntax match Comment "\v#(.*)"
" Numbers (lucius=#8cd0d3)
syntax match Number "\v\d"

let b:current_syntax = "rummy"
