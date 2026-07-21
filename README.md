# dotfiles

## Overview

### Operating System

Fedora 44 Workstation (GNOME)

### Usage

Installs my desired desktop layout using `make` for package management and `stow` to handle configuration.

Each application or ***component*** is designed to be installed and configured independently, however, dependencies between components are highlighted by the root-level Makefile.

Components reside in their own directory and have their own Makefile. Each component handles its own configuration with separate calls to `stow`.

A component's configuration is managed within it's `<comp>/<comp>.stpkg/` directory. Stow links these to the needed allowing configuration changes to be tracked in source.

Any configuration files that below in the user's root or home directory are managed within the `_root.stpkg` directory.

``` bash
# Run make all to install and configure everything
make all

# Or just install and configure a single component
make nvim

```

## To Do

### nvim

- Treesiter is now included in nvim
- Spell checker

