defmodule Extra do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # start a GameServer with numbers between 1 and 100
      worker(Extra.GameServer, [1, 100]),
    ]

    opts = [strategy: :one_for_one, name: Extra.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
