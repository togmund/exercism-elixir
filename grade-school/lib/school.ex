defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t(), integer) :: map
  def add(db, name, grade) do
    # %{}
    # %{2 => ["Aimee"]}
    # %{2 => ["Aimee", "Percy"]}
    db
    |> Map.update(grade, [name], fn current_list -> [name | current_list] end)

    # current_list = Map.get(db, grade, [])
    # updated_list = [name | current_list]
    ## (current_list ++ [name]) |> IO.inspect()
    # Map.put(db, grade, updated_list)
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t()]
  def grade(db, grade) do
    # %{2 => ["Aimee"]}
    # db[2] ~= Map.get(db, 2)
    # db[grade] || [] ~= db |> Map.get(grade, [])
    db
    |> Map.get(grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t()]}]
  def sort(db) do
    db
    |> IO.inspect()
    |> Map.to_list()
    |> Enum.map(fn {grade, list_of_students} -> {grade, Enum.sort(list_of_students)} end)
  end
end
