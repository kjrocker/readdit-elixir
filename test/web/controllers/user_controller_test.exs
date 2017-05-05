defmodule Readdit.Web.UserControllerTest do
  use Readdit.Web.ConnCase

  alias Readdit.Accounts

  @create_attrs %{username: "some username", password: "password123", password_confirmation: "password123"}
  @update_attrs %{username: "some updated username"}
  @invalid_attrs %{username: nil}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  # test "lists all entries on index", %{conn: conn} do
  #   conn = get conn, user_path(conn, :index)
  #   assert html_response(conn, 200)
  # end

  test "renders form for new users", %{conn: conn} do
    conn = get conn, user_path(conn, :new)
    assert html_response(conn, 200)
  end

  test "creates user and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == user_path(conn, :show, id)

    conn = get conn, user_path(conn, :show, id)
    assert html_response(conn, 200)
  end

  test "does not create user and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @invalid_attrs
    assert html_response(conn, 200)
  end

  # test "renders form for editing chosen user", %{conn: conn} do
  #   user = fixture(:user)
  #   conn = get conn, user_path(conn, :edit, user)
  #   assert html_response(conn, 200) =~ "Edit User"
  # end

  # test "updates chosen user and redirects when data is valid", %{conn: conn} do
  #   user = fixture(:user)
  #   conn = put conn, user_path(conn, :update, user), user: @update_attrs
  #   assert redirected_to(conn) == user_path(conn, :show, user)
  #
  #   conn = get conn, user_path(conn, :show, user)
  #   assert html_response(conn, 200) =~ "some updated username"
  # end

  # test "does not update chosen user and renders errors when data is invalid", %{conn: conn} do
  #   user = fixture(:user)
  #   conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
  #   assert html_response(conn, 200) =~ "Edit User"
  # end

  # test "deletes chosen user", %{conn: conn} do
  #   user = fixture(:user)
  #   conn = delete conn, user_path(conn, :delete, user)
  #   assert redirected_to(conn) == user_path(conn, :index)
  #   assert_error_sent 404, fn ->
  #     get conn, user_path(conn, :show, user)
  #   end
  # end
end
