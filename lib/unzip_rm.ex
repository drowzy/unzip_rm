defmodule UnzipRm do
  def main(args) do
    IO.puts("Running main")

    args
    |> parse_args
    |> process
  end

  def process([]) do
    IO.puts("No arguments given")
  end

  def process(opts) do
    File.ls!(opts[:path])
    |> UnzipRm.Ext.filter_with_ext("zip")
    |> Enum.map(&(UnzipRm.Ext.extract(&1)))
    |> Enum.each(&(IO.puts("#{&1} extracted!")))
  end

  defp parse_args(args) do
    {opts, _, _} = OptionParser.parse(args, switches: [path: :string])

    opts
  end
end
