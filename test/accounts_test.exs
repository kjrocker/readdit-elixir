defmodule Readdit.AccountsTest do
  use Readdit.DataCase

  alias Readdit.Accounts
  alias Readdit.Accounts.User

  @create_attrs %{is_admin: true, password: "password123", password_confirmation: "password123", username: "some username"}
  @update_attrs %{is_admin: false, password: "password456", password_confirmation: "password456", username: "some updated username"}
  @invalid_attrs %{is_admin: nil, password_hash: nil, username: nil}

  def fixture(:user, attrs \\ @create_attrs) do
    {:ok, user} = Accounts.create_user(attrs)
    user
  end

  # test "list_users/1 returns all users" do
  #   user = fixture(:user)
  #   assert Accounts.list_users() == [user]
  # end

  test "get_user! returns the user with given id" do
    user = fixture(:user)
    assert Accounts.get_user!(user.id).username == user.username
  end

  test "create_user/1 with valid data creates a user" do
    assert {:ok, %User{} = user} = Accounts.create_user(@create_attrs)
    assert user.is_admin == true
    # assert user.password_hash == "some password_hash"
    assert user.username == "some username"
  end

  test "create_user/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
  end

  # test "update_user/2 with valid data updates the user" do
  #   user = fixture(:user)
  #   assert {:ok, user} = Accounts.update_user(user, @update_attrs)
  #   assert %User{} = user
  #   assert user.is_admin == false
  #   assert user.password_hash == "some updated password_hash"
  #   assert user.username == "some updated username"
  # end

  # test "update_user/2 with invalid data returns error changeset" do
  #   user = fixture(:user)
  #   assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
  #   assert user == Accounts.get_user!(user.id)
  # end

  # test "delete_user/1 deletes the user" do
  #   user = fixture(:user)
  #   assert {:ok, %User{}} = Accounts.delete_user(user)
  #   assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
  # end

  test "change_user/1 returns a user changeset" do
    user = fixture(:user)
    assert %Ecto.Changeset{} = Accounts.change_user(user)
  end
end
