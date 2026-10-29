class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.3.1/rex-amq-adapter_0.3.1_darwin_arm64.tar.gz"
      sha256 "44a82a8c274bf1824b797b9dcbdcf47cabe1285f8ad304f587e34d2230b5ce80"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.3.1/rex-amq-adapter_0.3.1_darwin_amd64.tar.gz"
      sha256 "d812330bb04585fc8cc3d61a7ef88d24368bbbc520b83df2b114ff98e49d32d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.3.1/rex-amq-adapter_0.3.1_linux_arm64.tar.gz"
      sha256 "2d09da53b640ac99af3b15c97ceb0f8b21d2c71f3a0bc5e3c760ab381cb0ba9f"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.3.1/rex-amq-adapter_0.3.1_linux_amd64.tar.gz"
      sha256 "9e5439240cab22264e0d19afead510ed57ab2f8ae59d2c7f175f28b5e9e1cf6d"
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
