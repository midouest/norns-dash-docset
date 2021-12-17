# norns-dash-docset

Generate a [Norns](https://monome.org/docs/norns/) docset for [Dash](https://kapeli.com/dash) using [Dashing](https://github.com/technosophos/dashing).

## Usage

### Requirements

- [Git](https://git-scm.com)
- [Dashing](https://github.com/technosophos/dashing)

### Updating Norns

Execute `checkout.sh` to initialize the `norns` submodule and checkout the tag for the latest release:

```shell
$ ./checkout.sh
```

### Generating the Docset

Execute `generate.sh` to generate the docset:

```shell
$ ./generate.sh
```

`generate.sh` will produce the following files in the `build/` directory:

- `docset.json` - Updated docset configuration file for submitting to [Kapeli/Dash-User-Contributions](https://github.com/Kapeli/Dash-User-Contributions)
- `norns.tgz` - Compressed norns Lua API docset

### Distributing the Docset

1. Fork and clone the [Kapeli/Dash-User-Contributions](https://github.com/Kapeli/Dash-User-Contributions) repository.

2. Copy the generated `docset.json` and `norns.tgz` files from the `build/` directory to the `docsets/norns` directory of your local `Dash-User-Contributions` repository, overwriting the previous versions.

3. Commit and push your changes, then create a pull request against the upstream `Dash-User-Contributions` repository.

## Acknowledgements

Norns icon taken with permission from [p3r7/rpmate](https://github.com/p3r7/rpmate).
