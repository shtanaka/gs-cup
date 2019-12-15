defmodule Server.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :balance, :float, default: 1000.0

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :balance])
    |> validate_required([:name, :email, :balance])
    |> validate_number(:balance, greater_than_or_equal_to: 0)
  end
end
