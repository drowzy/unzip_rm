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
    IO.puts("Arguments #{opts[:path]}")
  end

  defp parse_args(args) do
    {opts, _, _} = OptionParser.parse(args, switches: [path: :string])

    opts
  end
end
