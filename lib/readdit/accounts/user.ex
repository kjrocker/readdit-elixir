defmodule Readdit.Accounts.User do
  use Ecto.Schema

  schema "accounts_users" do
    field :is_admin, :boolean, default: false
    field :password_hash, :string
    field :username, :string

    timestamps()
  end
end
