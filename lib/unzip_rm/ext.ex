defmodule UnzipRm.Ext do
  def filter_with_ext(names, ext) do
    names
    |> Enum.filter(&(String.ends_with?(&1, ext)))
  end
end
