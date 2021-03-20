defmodule ExampleWeb.PageController do
  use ExampleWeb, :controller
  import Ecto.Query, only: [from: 2]

  def index(conn, _params) do
    conn
    |> assign(:pages, dynamic_pages())
    |> render("index.html")
  end

  def dynamic(conn, _params) do
    render_dynamic(conn)
  end

  defp dynamic_pages do
    Example.Repo.all(
      from p in Thesis.Page,
        where: not is_nil(p.template)
    )
  end
end
