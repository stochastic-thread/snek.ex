from erlport.erlterms import Atom
from erlport.erlang import call

def pids():
    Pid1 = call(Atom("erlang"), Atom("self"), [])
    Pid2 = call(Atom("erlang"), Atom("self"), [])
    return [Pid1, Pid2]

def pids_more(num):
    pidlist = []
    for x in range(0,num):
        pidlist.append(call(Atom("erlang"), Atom("self"), []))
    print "You just spawned " + str(num) + " processes in BEAM VM."
    print "Here they are!"
    return pidlist