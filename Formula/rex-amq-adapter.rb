class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.0/rex-amq-adapter_0.11.0_darwin_arm64.tar.gz"
      sha256 "d6500e3a61e7779884d1a96d250f31172322b752a79d9ca2d8dcb0175d8b9d25"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.0/rex-amq-adapter_0.11.0_darwin_amd64.tar.gz"
      sha256 "29687b096931958b92d7496c5acd4c17f5cc22c80b35582965530ff80086bdbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.0/rex-amq-adapter_0.11.0_linux_arm64.tar.gz"
      sha256 "13e8f859cddd4aef6b14f9667e05c451f98dd0eb041859835155d6512efa5e16"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.11.0/rex-amq-adapter_0.11.0_linux_amd64.tar.gz"
      sha256 "8a3db225b211c30ae0acdae568c1aa9f2b2b835d10479622ef0c60345ba69bb8"
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
