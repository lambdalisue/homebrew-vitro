# homebrew-vitro

Homebrew tap for [`vitro`](https://github.com/lambdalisue/vitro) — disposable
development VMs driven from a CLI.

```sh
brew install lambdalisue/vitro/vitro
```

It brings QEMU along, and installs the shell completions.

`Formula/vitro.rb` is generated: the vitro release workflow renders it from
`packaging/homebrew/vitro.rb` on every published release, pointing at that
release's prebuilt archives (macOS and Linux, x86_64 and arm64). Do not edit it
here — edit the template in the vitro repository instead.
