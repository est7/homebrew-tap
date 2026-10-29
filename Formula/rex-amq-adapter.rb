class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.3.2/rex-amq-adapter_0.3.2_darwin_arm64.tar.gz"
      sha256 "983fbc2aa65455403157f5a344c3b07f396236c48e7d636dde2890d475c3d7d0"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.3.2/rex-amq-adapter_0.3.2_darwin_amd64.tar.gz"
      sha256 "846dc005f58a1ae38476bff531f42c92cd87d30e487b8108f25887368dd85dce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.3.2/rex-amq-adapter_0.3.2_linux_arm64.tar.gz"
      sha256 "a81af4b3f89b36245a62580537cdbf93ca12dd6133d340e04c2b8de84e16a5cf"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.3.2/rex-amq-adapter_0.3.2_linux_amd64.tar.gz"
      sha256 "c7c13c6a65d6591bdba0cc8a883d9455e7a79cd7eb4249b546f1c0c07f8c3c4d"
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
