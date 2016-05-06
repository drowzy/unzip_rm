defmodule UnzipRm do
  def main(args) do
    IO.puts("Running main")
  end

  defp parseArgs(args) do
    {options, _, _} = OptionsParser.parse(args, switches: [path: :string])

    options
  end
end
