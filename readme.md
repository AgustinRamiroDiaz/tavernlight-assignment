# Software Developer Application @ Tavernlight

## Notes for reviewers

- This was my first time using Lua
- I wanted to verify my code with unit tests, so I chose `busted` as the testing framework due to its popularity.

## Dependencies

### Lua

Tests require the `busted` library

#### Installation

```sh
luarocks install moonscript --local
luarocks install busted --local
```

Remember to add the local `luarocks` bin directory to your `PATH` environment variable.

```sh
export PATH=$PATH:$HOME/.luarocks/bin
```

#### Running tests

```sh
busted
```
