class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.8.3/rex-amq-adapter_0.8.3_darwin_arm64.tar.gz"
      sha256 "b48c3d2b2d17ae37977c192de454a1e390091f86a5db9c1eb0055a345a29d405"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.8.3/rex-amq-adapter_0.8.3_darwin_amd64.tar.gz"
      sha256 "0654f726d71e7fe4b55a15f45e98f187d7ec33f159042b897e0171db42f695a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.8.3/rex-amq-adapter_0.8.3_linux_arm64.tar.gz"
      sha256 "742f29d77ea8eec47b3fb7b000eb1e843990a272d4213805d658286011ab43f8"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.8.3/rex-amq-adapter_0.8.3_linux_amd64.tar.gz"
      sha256 "96b90d5930e2c8ffe385130f55c5a8f8322ea085e9cffd32db4858dfd29a82b6"
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
