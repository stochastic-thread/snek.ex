defmodule Snake do
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
    :python.call(p, :sys, String.to_atom(Keyword.get(cmds, :vzn)), [])
  end

  def b do
    name = IO.gets "What's your name?\n"
    name = String.strip(name)
    {:ok, pp} = :python.start([{:python_path, to_char_list(Path.expand("lib/python_scripts"))},{:python, 'python'}])
    :python.call(pp, :play, :func, [name])
  end

  def c do
    {:ok, pp} = :python.start([{:python_path, to_char_list(Path.expand("lib/python_scripts"))},{:python, 'python'}])
    :python.call(pp, :atoms, :pids, [])
    :python.call(pp, :atoms, :pids_more, [1000])
  end

  def d do
    {:ok, pp} = :python.start([{:python_path, to_char_list(Path.expand("lib/python_scripts"))},{:python, 'python'}])
    :python.call(pp, :geo, :run, [])
  end
end
