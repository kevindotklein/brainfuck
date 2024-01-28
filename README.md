# brainfuck

## running brainfuck programs through repl

`iex -S mix`

```elixir
iex> Brainfuck.run ",+." # put the next ASCII character taken as input in out buffer
     # => returns a tuple with the current address, memory tape and the out buffer
```

## interpreting brainfuck from a file

`iex -S mix`

```elixir
iex> Cli.Reader.read_brainfuck "./examples/hello_world.b"
     # => return the out buffer
```

### todo
- [ ] nested loops