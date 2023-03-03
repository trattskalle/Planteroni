defmodule Planteroni.Plants.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :telegram_user_id, :string
    many_to_many :homes, Planteroni.Plants.Home, join_through: :users_to_homes

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:id, :name])
    |> validate_required([:id, :name])
  end
end
