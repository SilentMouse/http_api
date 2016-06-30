defmodule HttpApi do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(HttpApi.Worker, [arg1, arg2, arg3]),
      supervisor(Repo, []),
      worker(__MODULE__, [], function: :start_server)
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HttpApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def start_server do
      { :ok, _ } = Plug.Adapters.Cowboy.http HttpApi.Router, [],[acceptors: 2]
  end

end
