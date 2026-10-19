# Homebrew Tap

Homebrew tap for est7 tools.

Install `skills-switch` directly from this tap:

```sh
brew install est7/tap/skills-switch
```

The `skills-switch` formula follows the latest stable GitHub release through an hourly workflow. Maintainers can also dispatch the workflow with an explicit release tag.

Install `rex-amq-adapter` (AMQ messaging between coding agents in Rex terminals; pulls in `amq`), then set up its hooks:

```sh
brew install est7/tap/rex-amq-adapter
rex-amq-adapter setup
```

Its formula is updated by hand for each release of [est7/rex-amq-adapter](https://github.com/est7/rex-amq-adapter): new release URLs and the `sha256` values from the release's `SHA256SUMS`.
