defmodule RnaTranscription do
  @dna_to_rna_map %{
    # * `G` -> `C`
    71 => 67,
    # * `C` -> `G`
    67 => 71,
    # * `T` -> `A`
    84 => 65,
    # * `A` -> `U`
    65 => 85
  }

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(fn char -> Map.get(@dna_to_rna_map, char) end)
  end
end
