class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.5/rex-amq-adapter_0.9.5_darwin_arm64.tar.gz"
      sha256 "66e0c7a25f97ad521d1de7d6d9516c0b22e0b1f7c3155051302c2efa4e69597e"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.5/rex-amq-adapter_0.9.5_darwin_amd64.tar.gz"
      sha256 "495e6b4a2eab0ddde51414006bb3500d4cab990c7f65569a0f7cdbc32d4d7a5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.5/rex-amq-adapter_0.9.5_linux_arm64.tar.gz"
      sha256 "6ba0ac299145d9f5d56b6e3adae590206c2be9ffd8eefc6faa9899e70ed14e03"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.5/rex-amq-adapter_0.9.5_linux_amd64.tar.gz"
      sha256 "94cb5f1efbd5a8b236bbdce75a04b77aac7fb71b41c48f01b4bd3afb386a85b7"
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
