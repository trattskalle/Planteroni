defmodule PlanteroniWeb.PlantHTML do
  use PlanteroniWeb, :html

  embed_templates "plant_html/*"

  @doc """
  Renders a plant form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def plant_form(assigns)
end
