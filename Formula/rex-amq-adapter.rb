class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.12.0/rex-amq-adapter_0.12.0_darwin_arm64.tar.gz"
      sha256 "8bb2db57be1d4ca9accb42660d53f625ac063ae48dcc2bb6b7538c621b4aeddb"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.12.0/rex-amq-adapter_0.12.0_darwin_amd64.tar.gz"
      sha256 "26a1547bcd38d43c70af91c0fc2e7701d73cbe986321a9d6c3ee3bad704942ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.12.0/rex-amq-adapter_0.12.0_linux_arm64.tar.gz"
      sha256 "a1cc473edc702156534812fc8d4cba160d1fda34c65484db75ba09e426c27053"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.12.0/rex-amq-adapter_0.12.0_linux_amd64.tar.gz"
      sha256 "48adf1b75427c72c6034237af900d98628af6c4eec4fe03d2f31b1036ec81409"
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
