class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.9/rex-amq-adapter_0.9.9_darwin_arm64.tar.gz"
      sha256 "47bf183f703c47e5287aed437f4e3617d1bdfaa7efdc98ef20dc6746e4f20311"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.9/rex-amq-adapter_0.9.9_darwin_amd64.tar.gz"
      sha256 "9694c66e0a9c764e6da9ceb829aa58240f709e5fd98e2910f758c74e93914b33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.9/rex-amq-adapter_0.9.9_linux_arm64.tar.gz"
      sha256 "62a07defe35712275f71e583186a9ae94ea7ea3e8765e924b20fc9c2395fb752"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.9/rex-amq-adapter_0.9.9_linux_amd64.tar.gz"
      sha256 "9deb902217e9b32e4fd24220cc165cd017b4f7ee5e8c1ae8a722b18ef0a25dc0"
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
