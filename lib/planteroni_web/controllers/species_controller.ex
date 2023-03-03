defmodule PlanteroniWeb.SpeciesController do
  use PlanteroniWeb, :controller

  alias Planteroni.Plants
  alias Planteroni.Plants.Species

  def index(conn, _params) do
    species = Plants.list_species()
    render(conn, :index, species: species)
  end

  def new(conn, _params) do
    changeset = Plants.change_species(%Species{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"species" => species_params}) do
    case Plants.create_species(species_params) do
      {:ok, species} ->
        conn
        |> put_flash(:info, "Species created successfully.")
        |> redirect(to: ~p"/species/#{species}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    species = Plants.get_species!(id)
    render(conn, :show, species: species)
  end

  def edit(conn, %{"id" => id}) do
    species = Plants.get_species!(id)
    changeset = Plants.change_species(species)
    render(conn, :edit, species: species, changeset: changeset)
  end

  def update(conn, %{"id" => id, "species" => species_params}) do
    species = Plants.get_species!(id)

    case Plants.update_species(species, species_params) do
      {:ok, species} ->
        conn
        |> put_flash(:info, "Species updated successfully.")
        |> redirect(to: ~p"/species/#{species}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, species: species, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    species = Plants.get_species!(id)
    {:ok, _species} = Plants.delete_species(species)

    conn
    |> put_flash(:info, "Species deleted successfully.")
    |> redirect(to: ~p"/species")
  end
end
