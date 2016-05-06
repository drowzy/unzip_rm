defmodule UnzipRm do
  def main(args) do
    IO.puts("Extracting")

    args
    |> parse_args
    |> process
  end

  def process([]) do
    IO.puts("No arguments given")
  end

  def process(opts) do
    archives = File.ls!(opts[:path]) |> UnzipRm.Ext.filter_with_ext("zip")

    extract_all(archives)
    |> print_all("Extract")

    delete_all(archives)
    |> print_all("Delete")

  end

  defp extract_all(archives) do
    archives
    |> Enum.map(&(UnzipRm.Ext.extract(&1)))
  end

  defp delete_all(archives) do
    archives
    |> Enum.map(&(UnzipRm.Ext.delete(&1)))
  end

  defp parse_args(args) do
    {opts, _, _} = OptionParser.parse(args, switches: [path: :string])

    opts
  end

  defp print_all(result, action) do
    result
    |> Enum.map(&(print_result(&1, action)))
    |> Enum.each(&(IO.puts(&1)))
  end

  defp print_result({:ok, result}, action) do
    "#{action}: #{result}"
  end

  defp print_result({:error, reason}, action) do
    "#{action} failed due to #{reason}"
  end
end
