defmodule Planteroni.PlantsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Planteroni.Plants` context.
  """

  @doc """
  Generate a species.
  """
  def species_fixture(attrs \\ %{}) do
    {:ok, species} =
      attrs
      |> Enum.into(%{
        id: "7488a646-e31f-11e4-aace-600308960662",
        image: "some image",
        name: "some name",
        thirst: 42
      })
      |> Planteroni.Plants.create_species()

    species
  end

  @doc """
  Generate a plant.
  """
  def plant_fixture(attrs \\ %{}) do
    {:ok, plant} =
      attrs
      |> Enum.into(%{
        id: "7488a646-e31f-11e4-aace-600308960662",
        last_watered_date: ~N[2023-03-02 10:47:00]
      })
      |> Planteroni.Plants.create_plant()

    plant
  end

  @doc """
  Generate a home.
  """
  def home_fixture(attrs \\ %{}) do
    {:ok, home} =
      attrs
      |> Enum.into(%{
        id: "7488a646-e31f-11e4-aace-600308960662",
        name: "some name"
      })
      |> Planteroni.Plants.create_home()

    home
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        id: "7488a646-e31f-11e4-aace-600308960662",
        name: "some name"
      })
      |> Planteroni.Plants.create_user()

    user
  end
end
