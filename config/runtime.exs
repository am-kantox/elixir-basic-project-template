import Config

config :key_value_store,
  any_key: System.get_env("RUNTIME", "none")
