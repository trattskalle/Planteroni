defmodule PlanteroniWeb.HomeHTML do
  use PlanteroniWeb, :html

  embed_templates "home_html/*"

  @doc """
  Renders a home form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def home_form(assigns)
end
