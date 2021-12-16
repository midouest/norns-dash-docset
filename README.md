# norns-dash-docset

Generate a [Norns](https://monome.org/docs/norns/) docset for [Dash](https://kapeli.com/dash) using [Dashing](https://github.com/technosophos/dashing).

## Requirements

- Dashing (see [install](https://github.com/technosophos/dashing#install) instructions)

## Updating the Docset

### 1. Clone Norns Repository

```shell
$ git clone https://github.com/monome/norns.git
$ git checkout <latest-version-tag>
```

Alternatively, you can download a zip of the repository at the latest release tag.

### 2. Copy Dashing Configuration

Copy `dashing.json` from this repository into `doc` directory of the `norns` repository.

```shell
$ cp dashing.json /path/to/norns/doc/
```

### 3. Run Dashing

```shell
$ cd /path/to/norns/doc/
$ dashing build norns
```

### 4. Compress Docset

```shell
$ tar --exclude='.DS_Store' --exclude='crone' -cvzf norns.tgz norns.docset
```

### 5. Create Pull Request

Fork and clone the [Kapeli/Dash-User-Contributions](https://github.com/Kapeli/Dash-User-Contributions) repository.

Copy the `norns.tgz` file generated in Step 4 to the `docsets/norns` directory of your local `Dash-User-Contributions` repository.

Update the `version` field in `docsets/norns/docset.json` to match the version that you checked out or downloaded in Step 1. Make sure that this version follows the [docset versioning guidelines](https://github.com/Kapeli/Dash-User-Contributions/wiki/Docset-Versioning-Guidelines).

Commit and push your changes, then create a pull request against the upstream `Dash-User-Contributions` repository.
