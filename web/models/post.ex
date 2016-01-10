defmodule KinoWebapp.Post do
  use KinoWebapp.Web, :model

  schema "posts" do
    belongs_to :user, KinoWebapp.User

    field :key, :string
    field :content, :string

    timestamps
  end

  @required_fields ~w(key content)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def render_content(post) do
    if String.ends_with?(post.key, ".md") do
      Earmark.to_html(post.content, %Earmark.Options{breaks: false})
    end
  end
end
