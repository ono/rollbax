defmodule Rollbax.Mixfile do
  use Mix.Project

  @version "0.8.1"

  def project() do
    [app: :rollbax,
     version: @version,
     elixir: "~> 1.1",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps(),
     name: "Rollbax",
     docs: [main: "Rollbax",
            source_ref: "v#{@version}",
            source_url: "https://github.com/elixir-addicts/rollbax",
            extras: ["pages/Using Rollbax in Plug-based applications.md"]]]
  end

  def application() do
    [applications: [:logger, :hackney, :poison],
     mod: {Rollbax, []}]
  end

  defp deps() do
    [{:hackney, "~> 1.1"},
     {:poison,  "~> 1.4 or ~> 2.0 or ~> 3.0"},

     {:ex_doc, ">= 0.0.0", only: :docs},
     {:earmark, ">= 0.0.0", only: :docs},

     {:plug,   "~> 1.0.0", only: :test},
     {:cowboy, "~> 1.0.0", only: :test}]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp description() do
    "Exception tracking and logging from Elixir to Rollbar"
  end

  defp package() do
    [maintainers: ["Aleksei Magusev", "Andrea Leopardi"],
     licenses: ["ISC"],
     links: %{"GitHub" => "https://github.com/elixir-addicts/rollbax"}]
  end
end
