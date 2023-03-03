defmodule Planteroni.Plants.Home do
  use Ecto.Schema
  import Ecto.Changeset

  schema "homes" do
    field :name, :string
    many_to_many :users, Planteroni.Plants.User, join_through: :users_to_homes
    has_many :plants, Planteroni.Plants.Plant

    timestamps()
  end

  @doc false
  def changeset(home, attrs) do
    home
    |> cast(attrs, [:id, :name])
    |> validate_required([:id, :name])
  end
end
