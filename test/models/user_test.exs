defmodule KinoWebapp.UserTest do
  use KinoWebapp.ModelCase

  alias KinoWebapp.User

  @valid_attrs %{email: "some content", public_key: "some content", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
