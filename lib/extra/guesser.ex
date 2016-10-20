defmodule Extra.Guesser do

  alias Extra.GameServer, as: Game

  def play do
    Game.start_game
    |> game_loop
  end

  def game_loop state do
    guess = div(state.low+state.high, 2)
    IO.puts "IS IT #{guess}?"
    response = Game.guess(guess)
    case response do
      :high -> game_loop %{state | high: guess}
      :low  -> game_loop %{state | low:  guess}
      :yes  -> IO.puts "THE NUMBER IS #{guess}"
    end
  end


end
