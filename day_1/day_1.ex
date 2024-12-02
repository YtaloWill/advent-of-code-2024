defmodule AdventOfCodeDay1 do
  def get_input do
    {:ok, content} = File.read("day_1_input.txt")
    content
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split(" ", trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.reduce({[], []}, fn [a, b], {list1, list2} ->
      {[a | list1], [b | list2]}
    end)
  end

  def part_1 do
    {list1, list2} = get_input()

    sorted_list1 = list1 |> Enum.sort()
    sorted_list2 = list2 |> Enum.sort()

    Enum.zip(sorted_list1, sorted_list2)
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
  end

  def part_2 do
    {list1, list2} = get_input()

    frequencies = Enum.frequencies(list2)

    Enum.map(list1, fn a -> {a, Map.get(frequencies, a, 0)} end)
    |> Enum.map(fn {a, b} -> a * b end)
    |> Enum.sum()
  end
end
