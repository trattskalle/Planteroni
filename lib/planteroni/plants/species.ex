defmodule Planteroni.Plants.Species do
  use Ecto.Schema
  import Ecto.Changeset

  schema "species" do
    field :image, :string
    field :name, :string
    field :thirst, :integer
    has_many :plants, Planteroni.Plants.Plant

    timestamps()
  end

  @doc false
  def changeset(species, attrs) do
    species
    |> cast(attrs, [:id, :name, :image, :thirst])
    |> validate_required([:id, :name, :image, :thirst])
  end
end
