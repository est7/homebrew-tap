class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.0/rex-amq-adapter_0.9.0_darwin_arm64.tar.gz"
      sha256 "6cc43e12a79c11669305f64af8e76c828a9b356c10e1df9b4061ebbd1145ff2d"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.0/rex-amq-adapter_0.9.0_darwin_amd64.tar.gz"
      sha256 "2e899e18a604fb5aa5d871a14136576410de4ef563f6dfae07649cca2d9d3286"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.0/rex-amq-adapter_0.9.0_linux_arm64.tar.gz"
      sha256 "30081e6587841b782f755b0e746e0acc8fbfb706c11d47409cde0d6a14528ee1"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.0/rex-amq-adapter_0.9.0_linux_amd64.tar.gz"
      sha256 "207b7b6c670d26e4d512142d63e11b950ddab6dcaf04d3c70d03019fd0b19c4d"
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
