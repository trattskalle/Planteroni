defmodule PlanteroniWeb.HomeController do
  use PlanteroniWeb, :controller

  alias Planteroni.Plants
  alias Planteroni.Plants.Home

  def index(conn, _params) do
    homes = Plants.list_homes()
    render(conn, :index, homes: homes)
  end

  def new(conn, _params) do
    changeset = Plants.change_home(%Home{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"home" => home_params}) do
    case Plants.create_home(home_params) do
      {:ok, home} ->
        conn
        |> put_flash(:info, "Home created successfully.")
        |> redirect(to: ~p"/homes/#{home}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    home = Plants.get_home!(id)
    render(conn, :show, home: home)
  end

  def edit(conn, %{"id" => id}) do
    home = Plants.get_home!(id)
    changeset = Plants.change_home(home)
    render(conn, :edit, home: home, changeset: changeset)
  end

  def update(conn, %{"id" => id, "home" => home_params}) do
    home = Plants.get_home!(id)

    case Plants.update_home(home, home_params) do
      {:ok, home} ->
        conn
        |> put_flash(:info, "Home updated successfully.")
        |> redirect(to: ~p"/homes/#{home}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, home: home, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    home = Plants.get_home!(id)
    {:ok, _home} = Plants.delete_home(home)

    conn
    |> put_flash(:info, "Home deleted successfully.")
    |> redirect(to: ~p"/homes")
  end
end
