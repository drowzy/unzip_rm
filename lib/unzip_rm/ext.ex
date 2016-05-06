defmodule UnzipRm.Ext do
  def filter_with_ext(names, ext) do
    names
    |> Enum.filter(&(String.ends_with?(&1, ext)))
  end

  def extract(file) do
    {:ok, files} = file |> String.to_char_list |> :zip.extract

    files
  end
end
