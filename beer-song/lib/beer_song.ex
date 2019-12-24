defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """

  @spec verse(integer) :: String.t()
  def verse(number) do
    case number do
      0 ->
        """
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, #{number + 99} bottles of beer on the wall.
        """

      1 ->
        """
        #{number} bottle of beer on the wall, #{number} bottle of beer.
        Take it down and pass it around, no more bottles of beer on the wall.
        """

      2 ->
        """
        #{number} bottles of beer on the wall, #{number} bottles of beer.
        Take one down and pass it around, #{number - 1} bottle of beer on the wall.
        """

      number ->
        """
        #{number} bottles of beer on the wall, #{number} bottles of beer.
        Take one down and pass it around, #{number - 1} bottles of beer on the wall.
        """
    end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    Enum.reduce(range, "", fn number, acc ->
      acc <> verse(number) <> "\n"
    end)
    |> String.slice(0..-2)
  end
end
