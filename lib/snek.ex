defmodule SNEK do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = []
    opts = [strategy: :one_for_one, name: Snake.Supervisor]
    Supervisor.start_link(children, opts)
  end


  def cmd(:vzn) do
    cmds = [ vzn: "version.__str__" ]
    {:ok, p} = :python.start()
    IO.puts :python.call(p, :sys, String.to_atom(Keyword.get(cmds, :vzn)), [])
    :python.stop(p)
  end

  def b do
    name = IO.gets "What's your name?\n"
    name = String.trim(name)
    {:ok, p} = :python.start([{:python_path, to_charlist(Path.expand("lib/python_scripts"))},{:python, 'python'}])
    :python.call(p, :play, :func, [name])
    :python.stop(p)
  end

  def spawn_threads(n_threads) do
    {:ok, p} = :python.start(
      [
        {:python_path, to_charlist(Path.expand("lib/python_scripts"))},
        {:python, 'python'}
      ])
    :python.call(p, :atoms, :pids, [])
    procs = :python.call(p, :atoms, :pids_more, [n_threads])
    IO.puts "Tuple left element is an agent containing an array of threads."
    IO.puts "Tuple right element is the process that runs the port connector to the python process"
    {p, procs}
  end

  @doc """
    Use kill_py_process(#PID<100.0>) with the right most element returned in spawn_threads
  """
  def kill_py_process(p) do
    :python.stop(p)
  end

  def d do
    {:ok, p} = :python.start([{:python_path, to_charlist(Path.expand("lib/python_scripts"))},{:python, 'python'}])
    :python.call(p, :geo, :run, [])
    :python.stop(p)
  end
end
