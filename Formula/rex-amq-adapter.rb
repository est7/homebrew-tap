class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.29.0/rex-amq-adapter_0.29.0_darwin_arm64.tar.gz"
      sha256 "28c8be4fc2a963e5e70cbaed5f5d70c98cc3ffaf0ada053fed17582a8c986a62"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.29.0/rex-amq-adapter_0.29.0_darwin_amd64.tar.gz"
      sha256 "795b68fa74fb5a9f5edd40aafa6e729d83c9479e9db1f06e3dbe52f54aa49235"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.29.0/rex-amq-adapter_0.29.0_linux_arm64.tar.gz"
      sha256 "d2e1face9ad2dcaec34fc0cdf1987d1ffa0e5d076aa2f182b048f6c5d45458f0"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.29.0/rex-amq-adapter_0.29.0_linux_amd64.tar.gz"
      sha256 "869e83cfbb961c6472f4f5eb8bf4b7432a3cdb1d9a6d0f492fe3df48629df7d0"
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
