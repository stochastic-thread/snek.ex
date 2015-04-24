defmodule Snake do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Snake.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Snake.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def py do
    {:ok, pp} = :python.start()
    :python.call(pp, :__builtin__, :print, ["hey there"])
  end
end
