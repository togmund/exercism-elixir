defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) == length(strand2) do
    # Enum.reduce()
    # 'TAG', 'GAT'
    # { 'T', 'G' } 0 => 1
    # { 'A', 'A' } 1 => 1
    # { 'G', 'T' } 1 => 2

    # 'TAG', 'GAT' => [{ 'T', 'G' }, { 'A', 'A' }, { 'G', 'T' }]
    hamming_distance =
      Enum.zip(strand1, strand2)
      |> Enum.reduce(0, fn {char1, char2}, acc ->
        if char1 != char2 do
          acc + 1
        else
          acc
        end
      end)

    {:ok, hamming_distance}
  end

  def hamming_distance(_strand1, _strand2), do: {:error, "Lists must be the same length"}
end
