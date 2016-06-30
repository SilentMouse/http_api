defmodule HttpApi.Router do
  @moduledoc false

    import Plug.Conn
    use Plug.Router

    @name "name"

    plug :match
    plug :dispatch

    get "/" do
      send_resp(conn, 200, "Hello Plug!")
    end

    get "/users" do
      conn = fetch_query_params(conn)
      send_resp(conn, 200, "#{User.all_to_json}")
    end

    get "/users/:name" do
      conn = fetch_query_params(conn)
      send_resp(conn, 200, "#{User.get_by_to_json(name)}")
    end

    post "/users" do
      conn = fetch_query_params(conn)
      send_resp(conn, 200, "#{User.insert(conn)}")
    end

    match _ do
      send_resp(conn, 404, "Nothing here")
    end

end