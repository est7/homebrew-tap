class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.28.0/rex-amq-adapter_0.28.0_darwin_arm64.tar.gz"
      sha256 "815e819b46d140f1833982288544f95630777bf219b2625b2334471285f711fe"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.28.0/rex-amq-adapter_0.28.0_darwin_amd64.tar.gz"
      sha256 "1fd7b354cdd33f9dcf9aff8204416a0068b8fe70b4a377ea5fd64ab900ef1dd4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.28.0/rex-amq-adapter_0.28.0_linux_arm64.tar.gz"
      sha256 "e08dfda9dee89f761e3b00983e220a23c4b88d69244611dd4b5cdc23db0f41c0"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.28.0/rex-amq-adapter_0.28.0_linux_amd64.tar.gz"
      sha256 "5ffc9137f5089db81c2f8810ce125ff353a3036e4f5d26a6b03d63fb04b22ab3"
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
