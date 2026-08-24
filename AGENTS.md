# AGENTS.md

## Cursor Cloud specific instructions

This repository is a **Homebrew tap** (`krambox/formulae`), not an application with
runnable services. The only "product" is the formula in `Formula/obscura.rb`, which
packages prebuilt **macOS-only** binaries of `obscura` / `obscura-worker`. There is no
server to start, no database, and no language toolchain to install — the entire dev
workflow is `brew` commands.

### Toolchain / environment

- **Homebrew is the only dependency.** It is installed at `/home/linuxbrew/.linuxbrew`
  and captured in the environment snapshot. `brew` is added to `PATH` via
  `~/.bashrc` (`eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"`). If a
  shell doesn't have `brew` on `PATH` (e.g. a non-interactive shell), run that eval
  first or call `/home/linuxbrew/.linuxbrew/bin/brew` directly.
- This repo is registered as a tap via a symlink:
  `/home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/krambox/homebrew-formulae -> /workspace`.
  The update script recreates it if missing. All `brew` subcommands should reference the
  formula as `krambox/formulae/obscura`.
- This Homebrew version enforces "tap trust". The tap has been trusted
  (`brew trust krambox/formulae`); if trust is ever missing, either re-run that or set
  `HOMEBREW_NO_REQUIRE_TAP_TRUST=1`.

### Lint / test / build-run (standard commands)

- Lint (style): `brew style krambox/formulae`
- Lint (formula definition audit, incl. online URL/checksum checks):
  `brew audit --strict --online krambox/formulae/obscura`
- Test (what CI's Linux job effectively runs): `brew test-bot --only-tap-syntax`
  (see `.github/workflows/tests.yml`). CI also runs `brew test-bot --only-formulae` on
  **macOS** runners for PRs.
- Build/run the formula: `brew install krambox/formulae/obscura`
  (downloads the release tarball, verifies the pinned SHA256, installs both binaries).

### Non-obvious platform caveats

- The release binaries are **Mach-O (macOS-only)**. On this Linux VM, `brew fetch` and
  `brew install` succeed (download + checksum verification + `bin.install` both work),
  but the binaries **cannot execute** on Linux, so the formula's `test do` block
  (`obscura --version`) and `brew test obscura` will fail here. Full runtime testing of
  the binary requires a macOS runner (that is what the macOS matrix legs in CI cover).
- `brew audit --strict` behaves differently depending on install state: run against the
  **not-installed** formula it passes; run while the formula **is installed** on Linux it
  emits a "Non-executables were installed to .../bin" finding because the extracted
  macOS binaries land as mode `0444` on this filesystem. This is a Linux-only artifact,
  not a formula defect — audit the formula definition with the formula uninstalled.
