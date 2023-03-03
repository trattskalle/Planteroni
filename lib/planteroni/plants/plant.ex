defmodule Planteroni.Plants.Plant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "plants" do
    field(:name, :string)
    field(:last_watered_date, :naive_datetime)
    belongs_to(:species, Planteroni.Plants.Species)
    belongs_to(:last_watered_by, Planteroni.Plants.User)
    belongs_to(:home, Planteroni.Plants.Home)

    timestamps()
  end

  @doc false
  def changeset(plant, attrs) do
    plant
    |> cast(attrs, [:name, :last_watered_date])
    |> validate_required([:name, :last_watered_date])
  end
end
