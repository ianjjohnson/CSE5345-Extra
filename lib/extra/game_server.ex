defmodule Extra.GameServer do

  use GenServer
  @me :gameserver

  #Interface

  def start_link(low, high) do
    GenServer.start __MODULE__, %{low: low, high: high}, name: @me
  end

  def guess(num) do
    GenServer.call @me, {:guess, num}
  end



  #Implementation

  def init(args) do
    num = :rand.uniform(args.high-args.low+1) + args.low - 1
    {:ok, Map.put(args, :num, num)}
  end

  def handle_call {:guess, guess}, _from, state do
    IO.inspect state
    cond do
      guess >  state.num -> IO.puts "high"
                            {:reply, :high, state}
      guess <  state.num -> IO.puts "low"
                            {:reply, :low,  state}
      guess == state.num -> IO.puts "yes!"
                            {:reply, :yes,  state}
    end
  end

  #IO.puts "I'm thinking of a number between #{Enum.at(args, 0)} and #{Enum.at(args, 1)}."

end
