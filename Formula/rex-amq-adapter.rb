class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.26.0/rex-amq-adapter_0.26.0_darwin_arm64.tar.gz"
      sha256 "e409d294367a04695e46e9ef5d5267f6fc5733590f924395f72e0395dc41edf3"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.26.0/rex-amq-adapter_0.26.0_darwin_amd64.tar.gz"
      sha256 "c6cea9222b2235a2f726383a9c04dec04f56c86399e4024d959d2848c5b0e6cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.26.0/rex-amq-adapter_0.26.0_linux_arm64.tar.gz"
      sha256 "d9b13842c50d04df950201a0800e64b03df6d1db24dce3671e069f966e5425e3"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.26.0/rex-amq-adapter_0.26.0_linux_amd64.tar.gz"
      sha256 "ce29c9903f88adba12873754c2ec026eff42ed10d154ce768777985a65123371"
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
