defmodule Readdit.Repo.Migrations.CreateReaddit.Accounts.User do
  use Ecto.Migration

  def change do
    create table(:accounts_users) do
      add :username, :string, null: false
      add :password_hash, :string, null: false
      add :is_admin, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:accounts_users, [:username])
  end
end
