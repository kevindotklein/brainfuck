defmodule Brainfuck do

  @bf_inc  "+"
  @bf_dec  "-"
  @bf_pinc ">"
  @bf_pdec "<"
  @bf_putc "."
  @bf_getc ","
  @bf_lstr "["
  @bf_lend "]"
  @empty   ""

  @spec run(binary()) :: {integer(), [integer()], binary()}
  def run(program) when is_binary(program), do: run(program, 0, List.duplicate(0, 255), "")

  defp run(<<>>, addr, mem, out), do: {addr, mem, out}

  defp run(@bf_inc <> rest, addr, mem, out) do
    run(rest, addr, mem |> inc_at(addr), out)
  end

  defp run(@bf_dec <> rest, addr, mem, out) do
    run(rest, addr, mem |> dec_at(addr), out)
  end

  defp run(@bf_pinc <> rest, addr, mem, out) when addr < 255 do
    run(rest, addr+1, mem, out)
  end

  defp run(@bf_pdec <> rest, addr, mem, out) when addr > 0 do
    run(rest, addr-1, mem, out)
  end

  defp run(@bf_putc <> rest, addr, mem, out) do
    run(rest, addr, mem, out <> (mem |> char_at(addr)))
  end

  defp run(@bf_getc <> rest, addr, mem, out) do
    v = case IO.getn("input: ", 2) do
      :eof -> 0
      c -> c
    end
    run(rest, addr, mem |> put_at(addr, v), out)
  end

  defp inc_at(list, addr) do
    list |> List.update_at(addr, &(&1+1 |> rem(255)))
  end

  defp dec_at(list, addr) do
    list |> List.update_at(addr, &(&1-1 |> rem(255)))
  end

  defp char_at(list, addr), do: [list |> Enum.at(addr)] |> to_string

  defp put_at(list, addr, value), do: list |> List.replace_at(addr, value |> String.to_charlist |> hd)

end
