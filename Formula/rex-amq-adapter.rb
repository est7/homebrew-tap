class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.5.1/rex-amq-adapter_0.5.1_darwin_arm64.tar.gz"
      sha256 "3f390a17dafada192338ab31f2af6eb6e4143e33ab1aba5e6087a3af665ccd4c"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.5.1/rex-amq-adapter_0.5.1_darwin_amd64.tar.gz"
      sha256 "255de39a2a75be08b3173075110537a45bd65f181e3b35c220d836994f0f623b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.5.1/rex-amq-adapter_0.5.1_linux_arm64.tar.gz"
      sha256 "aaaa8093078701da7160e24d0327327d5bc1a5acd2aabab2b3df1fd534ca99da"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.5.1/rex-amq-adapter_0.5.1_linux_amd64.tar.gz"
      sha256 "60ee3a1e1a0b32d396065691052d6d45bdfa19d0324a9d916f52707d00e0b8c4"
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
