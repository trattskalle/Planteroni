defmodule PlanteroniWeb.PlantControllerTest do
  use PlanteroniWeb.ConnCase

  import Planteroni.PlantsFixtures

  @create_attrs %{id: "7488a646-e31f-11e4-aace-600308960662", last_watered_date: ~N[2023-03-02 10:47:00]}
  @update_attrs %{id: "7488a646-e31f-11e4-aace-600308960668", last_watered_date: ~N[2023-03-03 10:47:00]}
  @invalid_attrs %{id: nil, last_watered_date: nil}

  describe "index" do
    test "lists all plants", %{conn: conn} do
      conn = get(conn, ~p"/plants")
      assert html_response(conn, 200) =~ "Listing Plants"
    end
  end

  describe "new plant" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/plants/new")
      assert html_response(conn, 200) =~ "New Plant"
    end
  end

  describe "create plant" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/plants", plant: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/plants/#{id}"

      conn = get(conn, ~p"/plants/#{id}")
      assert html_response(conn, 200) =~ "Plant #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/plants", plant: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Plant"
    end
  end

  describe "edit plant" do
    setup [:create_plant]

    test "renders form for editing chosen plant", %{conn: conn, plant: plant} do
      conn = get(conn, ~p"/plants/#{plant}/edit")
      assert html_response(conn, 200) =~ "Edit Plant"
    end
  end

  describe "update plant" do
    setup [:create_plant]

    test "redirects when data is valid", %{conn: conn, plant: plant} do
      conn = put(conn, ~p"/plants/#{plant}", plant: @update_attrs)
      assert redirected_to(conn) == ~p"/plants/#{plant}"

      conn = get(conn, ~p"/plants/#{plant}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, plant: plant} do
      conn = put(conn, ~p"/plants/#{plant}", plant: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Plant"
    end
  end

  describe "delete plant" do
    setup [:create_plant]

    test "deletes chosen plant", %{conn: conn, plant: plant} do
      conn = delete(conn, ~p"/plants/#{plant}")
      assert redirected_to(conn) == ~p"/plants"

      assert_error_sent 404, fn ->
        get(conn, ~p"/plants/#{plant}")
      end
    end
  end

  defp create_plant(_) do
    plant = plant_fixture()
    %{plant: plant}
  end
end
