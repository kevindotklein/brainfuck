# brainfuck
[brainfuck ref](https://gist.github.com/roachhd/dce54bec8ba55fb17d3a)

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
     # Hello, World!
     # => prints the out buffer
```

### todo
- [ ] nested loops
- [ ] increase input buffer