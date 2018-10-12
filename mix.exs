defmodule SNEK.Mixfile do
  use Mix.Project

  def project do
    [app: :snek,
     version: "0.0.2",
     elixir: "~> 1.7.0-dev",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger],
     mod: {SNEK, []}]
  end

  defp deps() do
    [
      {:erlport, git: "https://github.com/hdima/erlport.git"},
      {:number, "~> 0.5.7"}
    ]
  end
end
