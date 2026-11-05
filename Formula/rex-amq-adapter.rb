class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.8.2/rex-amq-adapter_0.8.2_darwin_arm64.tar.gz"
      sha256 "4e59540863bc6f2613f0b6859c9eb938f8a9074e908da04ac48c6c4faa541348"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.8.2/rex-amq-adapter_0.8.2_darwin_amd64.tar.gz"
      sha256 "445cdb998bdd6eabc453f184021051fddef17ef0aadf5b417f3fdfc6bf3584f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.8.2/rex-amq-adapter_0.8.2_linux_arm64.tar.gz"
      sha256 "b6593d646dfd93920a22647a4a7a4b765594d486974ff068371b050d1cf97cb2"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.8.2/rex-amq-adapter_0.8.2_linux_amd64.tar.gz"
      sha256 "a44df8f9a4404de1e7ed5d990cc183a6af9e5ca7a6c55544dcd904fc3b790967"
    end
  end

  def install
    bin.install "rex-amq-adapter"
  end

  def caveats
    <<~EOS
      Install the skill and hooks for every agent found (Claude Code, Codex,
      Antigravity, Pi):
        rex-amq-adapter setup

      Start Codex with --no-daemon so its hooks and tools inherit the Rex pane environment.
      Codex runs new hooks only after you approve them with /hooks.
      Upgrades keep the hooks and the agent guide current: they run
      #{opt_bin}/rex-amq-adapter. If `rex-amq-adapter status` then reports
      anything outdated (such as the Pi extension), run setup again.
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/rex-amq-adapter version")
    assert_match "rex-amq-adapter", shell_output("#{bin}/rex-amq-adapter __internal skill")
  end
end
