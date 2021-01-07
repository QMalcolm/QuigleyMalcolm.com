defmodule QuigleyMalcolm.Repo do
  use Ecto.Repo,
    otp_app: :quigley_malcolm,
    adapter: Ecto.Adapters.Postgres
end
