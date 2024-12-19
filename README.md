## Installation

```sh
git clone git@github.com:w0de/dotfiles && cd dotfiles
export BREWTSTRAP=1 # set to enable brew setup and base packages install (./brew.sh)
./bootstrap.sh
```

## Functions/Aliases

### `http`

Open URLs from shell, with cheat codes for searching with ddg, opening github remote, querying gpt.

```sh
➜  dotfiles git:(main) http help
Usage
  http {COMMAND:repo,pulls,wat,ai,<url>} [ARGUMENT:<query>,<path>]
  __
Command
  repo                                                              open current repo's gh remote
  pulls                                                             alias for 'http repo pulls'
  wat                                                               query duckduckgo
  ai                                                                query chatgpt (requires session)
  py                                                                serve local path with python
  <url>                                                             open with browser
  help                                                              this message
  __
Argument
  query                                                             query for wat or ai cmd
  path                                                              path to append to url (eg 'pulls')
  __
```

### `venv`

Create and enter new python3 venv.

```sh
➜  dotfiles git:(main) ✗ venv
created virtual environment CPython3.11.9.final.0-64 in 323ms
  creator CPython3macOsBrew(dest=/Users/harry.seeber/src/dotfiles/.venv, clear=False, no_vcs_ignore=False, global=False)
  seeder FromAppData(download=False, pip=bundle, setuptools=bundle, wheel=bundle, via=copy, app_data_dir=/Users/harry.seeber/Library/Application Support/virtualenv)
    added seed packages: pip==24.3.1, setuptools==75.6.0, wheel==0.45.1
  activators BashActivator,CShellActivator,FishActivator,NushellActivator,PowerShellActivator,PythonActivator
type  source              loaded?
----  ------              -------
venv  .venv/bin/activate  ✅
.env  .env                ❌
```

### `venvter`

Enter current working directory's python venv. Load .env file if found.

### `wippit`

Commit (with message "wip") and push current repo state.

### `unixtime`

Print seconds since Jan 1, 1970.
