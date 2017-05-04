defmodule Readdit.Accounts.User do
  use Ecto.Schema

  schema "accounts_users" do
    field :is_admin, :boolean, default: false
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    field :username, :string

    timestamps()
  end
end
