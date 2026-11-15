class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.18.0/rex-amq-adapter_0.18.0_darwin_arm64.tar.gz"
      sha256 "5191d7758d873c58d46a01b09164a80d84d06ca0606aa499f6da440c0962300f"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.18.0/rex-amq-adapter_0.18.0_darwin_amd64.tar.gz"
      sha256 "87491c941c91f355ca5036cf530d4c0f45248d3756a604b5f5b5055f24a6e116"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.18.0/rex-amq-adapter_0.18.0_linux_arm64.tar.gz"
      sha256 "31aa58a3decda67dc9df80a28ffea8e735cdcf56ebb3d2f393ace0e1d06eca81"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.18.0/rex-amq-adapter_0.18.0_linux_amd64.tar.gz"
      sha256 "f25ee6c71275663ccabca8c5c92442caeaa6aa3fa1abc5b6d15aee5c4864c39d"
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
