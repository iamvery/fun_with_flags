defmodule FunWithFlags.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Public table so that every process can write to it.
    :ets.new(:fun_with_flags, [:set, :public, :named_table])

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: FunWithFlags.Worker.start_link(arg1, arg2, arg3)
      # worker(FunWithFlags.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FunWithFlags.Supervisor]
    Supervisor.start_link(children, opts)
  end
end