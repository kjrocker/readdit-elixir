defmodule Readdit.Web.UserController do
  use Readdit.Web, :controller

  alias Readdit.Accounts

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    changeset = Accounts.change_user(%{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    # here will be an implementation
  end
end
