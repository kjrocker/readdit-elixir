defmodule Readdit.Web.PageController do
  use Readdit.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
