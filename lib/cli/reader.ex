defmodule Cli.Reader do

  @spec parse_args() :: :ok | :error
  def parse_args do
    args = System.argv()
    if length(args) == 1 do
      read_brainfuck(args |> List.last)
    else
      usage()
    end
  end

  @spec read_brainfuck(binary()) :: :error | :ok
  def read_brainfuck(path) do
    case File.read(path) do
      {:ok, content} ->
        {_, _, out} = content |> Brainfuck.run
        IO.puts(out)
      {:error, reason} ->
        IO.puts("error in reading file #{path}: #{reason}")
        :error
    end
  end

  defp usage, do: IO.puts("in order to read a file: mix run cli/reader.ex <path_to_file>")

end

Cli.Reader.parse_args()
