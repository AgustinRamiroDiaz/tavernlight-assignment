# Software Developer Application @ Tavernlight

## Dependencies

### Lua

Tests require the `busted` library

#### Installation

```sh
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
