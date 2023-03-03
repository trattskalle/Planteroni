defmodule Planteroni.Repo.Migrations.CreateSpecies do
  use Ecto.Migration

  def change do
    create table(:homes) do
      add :name, :string

      timestamps()
    end

    create table(:users) do
      add :name, :string
      add :telegram_user_id, :string

      timestamps()
    end

    create table(:users_to_homes) do
      add :user_id, references(:users, on_delete: :nothing)
      add :home_id, references(:homes, on_delete: :nothing)
    end

    create table(:species) do
      add :name, :string
      add :image, :string
      add :thirst, :integer

      timestamps()
    end

    create table(:plants) do
      add :name, :string
      add :home_id, references(:homes, on_delete: :nothing)
      add :species_id, references(:species, on_delete: :nothing)
      add :last_watered_date, :naive_datetime
      add :last_watered_by_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:plants, [:last_watered_by_id])
  end
end
