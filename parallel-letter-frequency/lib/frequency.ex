defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    # ["ab -c", "A,B.C"] => %{"a" => 2, "b" => 2, "c" => 2}
    # ["a", "b"," ", ...]
    texts
    |> extract_all_graphemes()
    |> count_letters()
  end

  defp extract_all_graphemes(texts) do
    texts
    |> Enum.join()
    |> String.graphemes()
  end

  defp count_letters(graphemes) do
    Enum.reduce(graphemes, %{}, fn grapheme, acc ->
      # if grapheme is a letter
      # downcase
      # increment count of letter in acc
      if String.match?(grapheme, ~r/^\p{L}$/u) do
        downcased_letter = String.downcase(grapheme)
        Map.update(acc, downcased_letter, 1, fn count -> count + 1 end)

        # else
        # do nothing
      else
        acc
      end
    end)
  end
end
