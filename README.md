## What's this?
zigenv is a tool to manage multiple zig versions.

## Install

zigenv is installed by running one of the following commands in your terminal. 
You can install this via the command-line with either `curl`, `wget` or another similar tool.

| Method    | Command                                                                                           |
| :-------- | :------------------------------------------------------------------------------------------------ |
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/melhindi/zigenv/master/zigenv-init.sh)" && . $HOME/zigenv/zigenv-init.sh && zigenv install 0.13.0 && zigenv change 0.13.0` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/melhindi/zigenv/master/zigenv-init..sh)" && . $HOME/zigenv/zigenv-init.sh && zigenv install 0.13.0 && zigenv change 0.13.0`   |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/melhindi/zigenv/master/zigenv-init.sh)" && . $HOME/zigenv/zigenv-init.sh && zigenv install 0.13.0 && zigenv change 0.13.0` |

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
   change      Change current zig version
   install     Install a zig version
   uninstall   Uninstall a specific zig version
   version     Show the current zig version
   versions    List all zig versions available to zigenv
```

## License
[The MIT License](LICENSE)
