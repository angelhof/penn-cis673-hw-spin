bool flags[2];
int in_crit;
bool turn;


active [2] proctype proc(){
    bool temp
again:
    flags[_pid] = 1;
test:    turn = _pid;
    (flags[(1 - _pid)] == 0 || turn == (1 - _pid));
    
    temp = turn;

    // Critical section
    in_crit++
crit: assert(in_crit == 1)
    in_crit--
    
    flags[_pid] = 0;
    goto again
}


ltl invariant { [] !(proc[0]@crit && proc[1]@crit) && [] (<> proc[0]@crit) && [] (<> proc[1]@crit) && [] (proc[0]@test -> (! proc[1]@crit U proc[0]@crit))}