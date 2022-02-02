import Config

config :key_value_store, :key1, %{value: 42}

config :key_value_store,
  key2: %{value: :bar}

if File.exists?(Path.join("config", "#{Mix.env()}.exs")),
  do: import_config("#{Mix.env()}.exs")
