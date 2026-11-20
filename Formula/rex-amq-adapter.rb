class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.25.1/rex-amq-adapter_0.25.1_darwin_arm64.tar.gz"
      sha256 "7f21261695bd9afd4b8d2a33d90fbc52a1f05055d3ea39552a29d50891ac1e36"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.25.1/rex-amq-adapter_0.25.1_darwin_amd64.tar.gz"
      sha256 "69d5739c2a3ebdce6e29eab1931b43fdb4b448a02b728f72dcf952c98815e606"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.25.1/rex-amq-adapter_0.25.1_linux_arm64.tar.gz"
      sha256 "1b6f70008f03970cd19f503d24d49da48977cb38f93d724b001510b2c7d78f5f"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.25.1/rex-amq-adapter_0.25.1_linux_amd64.tar.gz"
      sha256 "46f28c6fcac86bc66c784c7edf73ab7591acf13260bebf4ac6e144a8c9763321"
    end
  end

  def install
    bin.install "rex-amq-adapter"
  end

  def caveats
    <<~EOS
      Install the skill and hooks for every agent found (Claude Code, Codex,
      Antigravity, Pi):
        rex-amq-adapter install setup

      Start Codex with --no-daemon so its hooks and tools inherit the Rex pane environment.
      Codex runs new hooks only after you approve them with /hooks.
      Upgrades keep the hooks current: they run #{opt_bin}/rex-amq-adapter.
      If `rex-amq-adapter install status` reports anything outdated (such as the
      SKILL.md stubs or Pi extension), run `rex-amq-adapter install setup` again.
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/rex-amq-adapter version --text")
    assert_match "mail", shell_output("#{bin}/rex-amq-adapter skill list --text")
  end
end
