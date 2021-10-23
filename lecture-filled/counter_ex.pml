#define N 5
byte counter 

active [N] proctype Proc() {
    do
    :: (counter % N == _pid) -> counter++
    od
}

ltl invariant { [] (counter <= 300)}