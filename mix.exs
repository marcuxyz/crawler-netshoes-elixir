defmodule Dwarf.MixProject do
  use Mix.Project

  def project do
    [
      app: :dwarf,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_options: [warnings_as_errors: true],
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # ensure test/support is compiled
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mox, "~> 1.0", only: :test},
      {:poison, "~> 5.0"},
      {:floki, "~> 0.34.0"},
      {:httpoison, "~> 2.0"}
    ]
  end
end
