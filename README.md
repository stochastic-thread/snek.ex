# snek

## To Do
I should really do this now, it'll only take a second, but I need to figure out why Zcash is the pile of trash it is more urgently. I will return. I always do:

[-] Save the python erlport process in an Agent, and retrieve it across all of the following functions.
However, problem could pose itself in that you would have shared state persist, which could lead to issues. Ideally, it would be best if a developer could just have a big string of the python program (or not, just read in from disk is better) and then pass it into a function that then spins up a python process that implements a simple "i run any code i get" logic, but that sounds a little dangerous.


## Description

Example repository to show what the equivalents of the Erlang/Python examples on [this page](http://erlport.org/docs/python.html) look like so that they work in an Elixir/Mix application.

Currently both functionalities work, as well as calling your own Python scripts from BEAM. 

## Usage

```
git clone http://github.com/arthurcolle/elixir-snake
cd elixir-snake
source activate <name of python virtualenv>
mix deps.get
mix compile
iex -S mix run
```
Other than having Python 2.7.9 installed (I used Anaconda) you should be good. Please feel free to submit pull requests, or even add cooler examples! 

**Example 1**: *Simple call to Python*

**```SNEK.cmd(cmd)```**

Note: only currently supported command is :vzn for py version.
More will come in time.

```
iex(3)> SNEK.cmd(:vzn)

"2.7.9 |Continuum Analytics, Inc.| (default, Dec 15 2014, 10:37:34) \n[GCC 4.2.1 (Apple Inc. build 5577)]"
```

**Example 2**: *More complicated call to your own Python script*

**```SNEK.b```**

```
iex(2)> SNEK.b
What's your name?
Arthur Colle
"Arthur Colle is a boss"
```

**Example 3**: *Ouroboros - Elixir script that calls Python that calls Erlang (spawns processes)*

**```SNEK.spawn_threads(num_threads)```**

```
iex(1)> SNEK.spawn_threads
You just spawned 999 processes in BEAM VM.
Here they are!
Tuple left element is an agent containing an array of threads.
Tuple right element is the process that runs the port connector to the python process
{#PID<0.165.0>,
[#PID<0.168.0>, #PID<0.169.0>, #PID<0.170.0>, #PID<0.171.0>, #PID<0.172.0>,
#PID<0.173.0>, #PID<0.174.0>, #PID<0.175.0>, #PID<0.176.0>, #PID<0.177.0>,
#PID<0.178.0>, #PID<0.179.0>, #PID<0.180.0>, #PID<0.181.0>, #PID<0.182.0>,
#PID<0.183.0>, #PID<0.184.0>, #PID<0.185.0>, #PID<0.186.0>, #PID<0.187.0>,
#PID<0.188.0>, #PID<0.189.0>, #PID<0.190.0>, #PID<0.191.0>, #PID<0.192.0>,
#PID<0.193.0>, #PID<0.194.0>, #PID<0.195.0>, #PID<0.196.0>, #PID<0.197.0>,
#PID<0.198.0>, #PID<0.199.0>, #PID<0.200.0>, #PID<0.201.0>, #PID<0.202.0>,
#PID<0.203.0>, #PID<0.204.0>, #PID<0.205.0>, #PID<0.206.0>, #PID<0.207.0>,
#PID<0.208.0>, #PID<0.209.0>, #PID<0.210.0>, #PID<0.211.0>, #PID<0.212.0>,
#PID<0.213.0>, #PID<0.214.0>, #PID<0.215.0>, ...]}
```

As you can see the above response is a tuple, left is the py proc (under the hood really its a port that enables
messaging with another process such as the python vm. On the right, your list of processes is available
