int counter 

active [5] proctype Proc() {
    (counter == _pid) -> counter++
    if
    :: (_pid == 4) -> assert(counter == 5)
    :: else -> skip
    fi
}