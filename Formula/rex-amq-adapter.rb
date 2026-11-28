class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.30.0/rex-amq-adapter_0.30.0_darwin_arm64.tar.gz"
      sha256 "a7dc030b0c350e69418f2e8f883b9b53171afaab05eebaf499c47959d5751dc7"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.30.0/rex-amq-adapter_0.30.0_darwin_amd64.tar.gz"
      sha256 "af9fe9f87a84cf8cad62431184138ad279ba796aa62322b8073ccd46f0595ddf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.30.0/rex-amq-adapter_0.30.0_linux_arm64.tar.gz"
      sha256 "05d35a87dc0a172ce52f29f7f2d7c13855119e60557cd3ea5489bd654fbf4d5c"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.30.0/rex-amq-adapter_0.30.0_linux_amd64.tar.gz"
      sha256 "9fbf64bb4ae7618a8522dca96a1a67a86b92002889e4b74ec9eb0b2c5e353844"
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
