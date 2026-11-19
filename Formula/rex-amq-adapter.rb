class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.24.0/rex-amq-adapter_0.24.0_darwin_arm64.tar.gz"
      sha256 "710c4b190ede1dfa0ad9529bd76a3f53136b86508e5a47dd810fcce1af20409b"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.24.0/rex-amq-adapter_0.24.0_darwin_amd64.tar.gz"
      sha256 "c05be01c636ac3948a788067358f93b3f5e4036bbae5fc45a551e536d442ccd9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.24.0/rex-amq-adapter_0.24.0_linux_arm64.tar.gz"
      sha256 "a70d387b3a26fc6b150c3746e23814716e613321ef9325d84c2c018ee7ab282d"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.24.0/rex-amq-adapter_0.24.0_linux_amd64.tar.gz"
      sha256 "e2a4cfef6a9fcb07cdb0762ade86e156b91196639e2e2814cb34114665079e17"
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
