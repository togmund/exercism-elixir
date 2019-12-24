defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    string_split =
      sentence
      |> String.replace("-", "")
      |> String.replace(" ", "")
      |> String.downcase()
      |> String.split("", trim: true)

    # |> String.to_charlist()
    # |> IO.inspect(charlists: :as_lists)

    string_split_unique = Enum.uniq(string_split)

    Enum.count(string_split) == Enum.count(string_split_unique)
  end
end
