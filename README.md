## What's this?
zigenv is a tool to manage multiple zig versions.

## Install
```
$ git clone https://github.com/d2verb/zigenv ~/.zigenv
```
Add the following to your .bash_profile or .bashrc.
```
export ZIGENV_ROOT=$HOME/.zigenv
export PATH=$ZIGENV_ROOT/bin:$ZIGENV_ROOT/shims:$PATH
```
## Usage
Install new zig version.
```
$ zigenv install builds # version master
$ zigenv install 0.3.0  # version 0.3.0
```

Change current zig version.
```
$ zigenv change builds # version master
$ zigenv change 0.3.0  # version 0.3.0
```

Show help message.
```
$ zigenv help
Usage: zigenv <command> [<args>]
Some useful zigenv commands are:
   set         Change current zig version
   install     Install a zig version
   uninstall   Uninstall a specific zig version
   version     Show the current zig version
   versions    List all zig versions available to zigenv
```

## License
[The MIT License](LICENSE)
