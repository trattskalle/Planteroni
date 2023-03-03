defmodule Planteroni.Repo do
  use Ecto.Repo,
    otp_app: :planteroni,
    adapter: Ecto.Adapters.SQLite3
end
