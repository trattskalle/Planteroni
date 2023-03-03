defmodule Planteroni.PlantsTest do
  use Planteroni.DataCase

  alias Planteroni.Plants

  describe "species" do
    alias Planteroni.Plants.Species

    import Planteroni.PlantsFixtures

    @invalid_attrs %{id: nil, image: nil, name: nil, thirst: nil}

    test "list_species/0 returns all species" do
      species = species_fixture()
      assert Plants.list_species() == [species]
    end

    test "get_species!/1 returns the species with given id" do
      species = species_fixture()
      assert Plants.get_species!(species.id) == species
    end

    test "create_species/1 with valid data creates a species" do
      valid_attrs = %{id: "7488a646-e31f-11e4-aace-600308960662", image: "some image", name: "some name", thirst: 42}

      assert {:ok, %Species{} = species} = Plants.create_species(valid_attrs)
      assert species.id == "7488a646-e31f-11e4-aace-600308960662"
      assert species.image == "some image"
      assert species.name == "some name"
      assert species.thirst == 42
    end

    test "create_species/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plants.create_species(@invalid_attrs)
    end

    test "update_species/2 with valid data updates the species" do
      species = species_fixture()
      update_attrs = %{id: "7488a646-e31f-11e4-aace-600308960668", image: "some updated image", name: "some updated name", thirst: 43}

      assert {:ok, %Species{} = species} = Plants.update_species(species, update_attrs)
      assert species.id == "7488a646-e31f-11e4-aace-600308960668"
      assert species.image == "some updated image"
      assert species.name == "some updated name"
      assert species.thirst == 43
    end

    test "update_species/2 with invalid data returns error changeset" do
      species = species_fixture()
      assert {:error, %Ecto.Changeset{}} = Plants.update_species(species, @invalid_attrs)
      assert species == Plants.get_species!(species.id)
    end

    test "delete_species/1 deletes the species" do
      species = species_fixture()
      assert {:ok, %Species{}} = Plants.delete_species(species)
      assert_raise Ecto.NoResultsError, fn -> Plants.get_species!(species.id) end
    end

    test "change_species/1 returns a species changeset" do
      species = species_fixture()
      assert %Ecto.Changeset{} = Plants.change_species(species)
    end
  end

  describe "plants" do
    alias Planteroni.Plants.Plant

    import Planteroni.PlantsFixtures

    @invalid_attrs %{id: nil, last_watered_date: nil}

    test "list_plants/0 returns all plants" do
      plant = plant_fixture()
      assert Plants.list_plants() == [plant]
    end

    test "get_plant!/1 returns the plant with given id" do
      plant = plant_fixture()
      assert Plants.get_plant!(plant.id) == plant
    end

    test "create_plant/1 with valid data creates a plant" do
      valid_attrs = %{id: "7488a646-e31f-11e4-aace-600308960662", last_watered_date: ~N[2023-03-02 10:47:00]}

      assert {:ok, %Plant{} = plant} = Plants.create_plant(valid_attrs)
      assert plant.id == "7488a646-e31f-11e4-aace-600308960662"
      assert plant.last_watered_date == ~N[2023-03-02 10:47:00]
    end

    test "create_plant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plants.create_plant(@invalid_attrs)
    end

    test "update_plant/2 with valid data updates the plant" do
      plant = plant_fixture()
      update_attrs = %{id: "7488a646-e31f-11e4-aace-600308960668", last_watered_date: ~N[2023-03-03 10:47:00]}

      assert {:ok, %Plant{} = plant} = Plants.update_plant(plant, update_attrs)
      assert plant.id == "7488a646-e31f-11e4-aace-600308960668"
      assert plant.last_watered_date == ~N[2023-03-03 10:47:00]
    end

    test "update_plant/2 with invalid data returns error changeset" do
      plant = plant_fixture()
      assert {:error, %Ecto.Changeset{}} = Plants.update_plant(plant, @invalid_attrs)
      assert plant == Plants.get_plant!(plant.id)
    end

    test "delete_plant/1 deletes the plant" do
      plant = plant_fixture()
      assert {:ok, %Plant{}} = Plants.delete_plant(plant)
      assert_raise Ecto.NoResultsError, fn -> Plants.get_plant!(plant.id) end
    end

    test "change_plant/1 returns a plant changeset" do
      plant = plant_fixture()
      assert %Ecto.Changeset{} = Plants.change_plant(plant)
    end
  end

  describe "homes" do
    alias Planteroni.Plants.Home

    import Planteroni.PlantsFixtures

    @invalid_attrs %{id: nil, name: nil}

    test "list_homes/0 returns all homes" do
      home = home_fixture()
      assert Plants.list_homes() == [home]
    end

    test "get_home!/1 returns the home with given id" do
      home = home_fixture()
      assert Plants.get_home!(home.id) == home
    end

    test "create_home/1 with valid data creates a home" do
      valid_attrs = %{id: "7488a646-e31f-11e4-aace-600308960662", name: "some name"}

      assert {:ok, %Home{} = home} = Plants.create_home(valid_attrs)
      assert home.id == "7488a646-e31f-11e4-aace-600308960662"
      assert home.name == "some name"
    end

    test "create_home/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plants.create_home(@invalid_attrs)
    end

    test "update_home/2 with valid data updates the home" do
      home = home_fixture()
      update_attrs = %{id: "7488a646-e31f-11e4-aace-600308960668", name: "some updated name"}

      assert {:ok, %Home{} = home} = Plants.update_home(home, update_attrs)
      assert home.id == "7488a646-e31f-11e4-aace-600308960668"
      assert home.name == "some updated name"
    end

    test "update_home/2 with invalid data returns error changeset" do
      home = home_fixture()
      assert {:error, %Ecto.Changeset{}} = Plants.update_home(home, @invalid_attrs)
      assert home == Plants.get_home!(home.id)
    end

    test "delete_home/1 deletes the home" do
      home = home_fixture()
      assert {:ok, %Home{}} = Plants.delete_home(home)
      assert_raise Ecto.NoResultsError, fn -> Plants.get_home!(home.id) end
    end

    test "change_home/1 returns a home changeset" do
      home = home_fixture()
      assert %Ecto.Changeset{} = Plants.change_home(home)
    end
  end

  describe "users" do
    alias Planteroni.Plants.User

    import Planteroni.PlantsFixtures

    @invalid_attrs %{id: nil, name: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Plants.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Plants.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{id: "7488a646-e31f-11e4-aace-600308960662", name: "some name"}

      assert {:ok, %User{} = user} = Plants.create_user(valid_attrs)
      assert user.id == "7488a646-e31f-11e4-aace-600308960662"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plants.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{id: "7488a646-e31f-11e4-aace-600308960668", name: "some updated name"}

      assert {:ok, %User{} = user} = Plants.update_user(user, update_attrs)
      assert user.id == "7488a646-e31f-11e4-aace-600308960668"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Plants.update_user(user, @invalid_attrs)
      assert user == Plants.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Plants.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Plants.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Plants.change_user(user)
    end
  end
end
