# MacSpace Homebrew Tap

The official Homebrew tap for [MacSpace](https://github.com/1architect/macspace-releases), a System Data and Apple Intelligence
cleaner for macOS 27 or later on Apple Silicon.

## Install

```bash
brew install --cask 1architect/macspace/macspace
```

## Update

MacSpace updates itself (Settings › General). To update through Homebrew instead:

```bash
brew upgrade --cask macspace
```

## Uninstall

If Debloat switched settings off, switch them back on in MacSpace first, and remove the MacSpace profile in
System Settings › General › Device Management. Then:

```bash
brew uninstall --zap --cask macspace
```

`--zap` also removes MacSpace's data and preferences.

The cask is updated by MacSpace's release process; please report problems in
[macspace-releases](https://github.com/1architect/macspace-releases/issues).
