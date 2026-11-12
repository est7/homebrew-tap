class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.13.0/rex-amq-adapter_0.13.0_darwin_arm64.tar.gz"
      sha256 "9064aeac7696992409e9b11f88790302834ceeccfccc07281e22a3da17faf9b5"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.13.0/rex-amq-adapter_0.13.0_darwin_amd64.tar.gz"
      sha256 "f0ecd3d9a81c44c24023d60bf51ca7cc74cb31d8ad9fbffe7cea06f363702d45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.13.0/rex-amq-adapter_0.13.0_linux_arm64.tar.gz"
      sha256 "25478e0de99e8cca9dcfdc9983275ab596f167e73606945a28c772949b16aa41"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.13.0/rex-amq-adapter_0.13.0_linux_amd64.tar.gz"
      sha256 "584fb65b8ea47546179056c4787efd7a919f6cb39cba327cd623b59796a54fd2"
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
