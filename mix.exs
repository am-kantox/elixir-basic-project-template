defmodule KeyValueStore.MixProject do
  use Mix.Project

  def project do
    [
      app: :key_value_store,
      version: "0.1.0",
      elixir: "~> 1.13-rc",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.25", only: :dev},
      {:dialyxir, "~> 1.0", runtime: false},
      {:credo, "~> 1.0", only: :dev}
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
