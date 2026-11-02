class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.4.2/rex-amq-adapter_0.4.2_darwin_arm64.tar.gz"
      sha256 "a59fd7cf7d34ba0dfc6c0dffd3d9a202444ba0546205e691e2ea6ae86d6b64f3"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.4.2/rex-amq-adapter_0.4.2_darwin_amd64.tar.gz"
      sha256 "7222cefb872a4e82267607b5a6c545bc33c09aaf3f96041df06d3351094f44b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.4.2/rex-amq-adapter_0.4.2_linux_arm64.tar.gz"
      sha256 "84a857873dc0b8a24b34ebf6c225171ae0f7979117aa787c87ec363f537c1c72"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.4.2/rex-amq-adapter_0.4.2_linux_amd64.tar.gz"
      sha256 "8a56013911f2b49a5b437367e6b9f4f3eed96c9c317301d3ae37b05bfa034e11"
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
