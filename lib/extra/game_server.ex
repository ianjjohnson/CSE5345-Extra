defmodule Extra.GameServer do

  use GenServer
  @me :gameserver

  #Interface

  def start_link(args) do
    GenServer.start __MODULE__, args, name: @me
  end



  #Implementation

  def init(args) do
    {:ok, args}
    IO.inspect args
  end

end
