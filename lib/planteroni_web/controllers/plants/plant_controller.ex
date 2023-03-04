defmodule PlanteroniWeb.PlantController do
  use PlanteroniWeb, :controller

  alias Planteroni.Plants
  alias Planteroni.Plants.Plant

  def index(conn, _params) do
    plants = Plants.list_plants()
    render(conn, :index, plants: plants)
  end

  def new(conn, _params) do
    changeset = Plants.change_plant(%Plant{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"plant" => plant_params}) do
    case Plants.create_plant(plant_params) do
      {:ok, plant} ->
        conn
        |> put_flash(:info, "Plant created successfully.")
        |> redirect(to: ~p"/plants/#{plant}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plant = Plants.get_plant!(id)
    render(conn, :show, plant: plant)
  end

  def edit(conn, %{"id" => id}) do
    plant = Plants.get_plant!(id)
    changeset = Plants.change_plant(plant)
    render(conn, :edit, plant: plant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "plant" => plant_params}) do
    plant = Plants.get_plant!(id)

    case Plants.update_plant(plant, plant_params) do
      {:ok, plant} ->
        conn
        |> put_flash(:info, "Plant updated successfully.")
        |> redirect(to: ~p"/plants/#{plant}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, plant: plant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plant = Plants.get_plant!(id)
    {:ok, _plant} = Plants.delete_plant(plant)

    conn
    |> put_flash(:info, "Plant deleted successfully.")
    |> redirect(to: ~p"/plants")
  end
end
