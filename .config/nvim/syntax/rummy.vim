" Deque (lucius=#93d6a9)
syntax keyword Type dup drop swap rotate size clear pair
" Mathematical (lucius=#cca3b3)
syntax keyword Special add subtract multiply divide mod equals gt lt exp abs sqrt
syntax match Special "\v\+"
syntax match Special "\v\-"
syntax match Special "\v\/"
syntax match Special "\v\*"
syntax match Special "\v\*\*"
syntax match Special "\v\<"
syntax match Special "\v\>"
syntax match Special "\v\%"
" String (lucius=#80c0d9)
syntax keyword String upcasedowncase concat chr ord
" Boolean operators (lucius=#b3d38c)
syntax keyword Operator and or xor not
" Pointer (lucius=#efaf7f)
syntax keyword Function as with in repeat until goto gotoif jmp jmpif return returnif proc end if unless else exit assert
" Include / Input (lucius=#f0dfaf)
syntax keyword Include input alias run include
" Output (lucius=#c0e0b0)
syntax keyword Directory trace inspect print
" Boolean (lucius=#8cd0d3)
syntax keyword Boolean true false
" Direction (lucius=#606060)
syntax match Comment "\v!"
" Comment (lucius=#606060)
syntax match Comment "\v#(.*)"
" Numbers (lucius=#8cd0d3)
syntax match Number "\v\d"
" Character (lucius=#8cd0d3)
syntax region MyString start="\"" end="\""
highlight link MyString Character
let b:current_syntax = "rummy"
