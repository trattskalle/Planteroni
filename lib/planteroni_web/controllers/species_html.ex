defmodule PlanteroniWeb.SpeciesHTML do
  use PlanteroniWeb, :html

  embed_templates "species_html/*"

  @doc """
  Renders a species form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def species_form(assigns)
end
