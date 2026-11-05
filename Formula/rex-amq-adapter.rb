class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.5.2/rex-amq-adapter_0.5.2_darwin_arm64.tar.gz"
      sha256 "b9f89f821cb8853c7f9f00b4e47b2e1cb85d99fa421f508aa01240c4807388cf"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.5.2/rex-amq-adapter_0.5.2_darwin_amd64.tar.gz"
      sha256 "c374b680b1c1585dc780f3e67e032daba593bf7aafdbb0888bd57e9d67e12d3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.5.2/rex-amq-adapter_0.5.2_linux_arm64.tar.gz"
      sha256 "0fbc8ca30b413d40aa32402c021c0dcc1d9ad635a2bd1be996cca21feda8182a"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.5.2/rex-amq-adapter_0.5.2_linux_amd64.tar.gz"
      sha256 "b9ebb47339def56ebb8de2c82f62b506ca6182dc4219d8910a382691c1dc8a1e"
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
