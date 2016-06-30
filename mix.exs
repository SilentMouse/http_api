defmodule HttpApi.Mixfile do
  use Mix.Project

  def project do
    [app: :http_api,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger,:cowboy,:plug,:mongodb_ecto, :ecto],
     mod: {HttpApi, []}]
  end


  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:poison, ">= 0.0.0"},
      {:cowboy, ">=0.0.0"},
      {:plug, ">=0.0.0"},
      {:mongodb_ecto, "~> 0.1"},
      {:ecto, ">=0.0.0"}
    ]
  end
end
