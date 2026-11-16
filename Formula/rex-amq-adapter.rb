class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.19.0/rex-amq-adapter_0.19.0_darwin_arm64.tar.gz"
      sha256 "0838e82ee0c567a5eb7d556e02155c94362d0ccab32df65afe6fc80369e55c52"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.19.0/rex-amq-adapter_0.19.0_darwin_amd64.tar.gz"
      sha256 "b5bf9ddc822eb805b2c557b6a093ecb6ec938bc2c09c1f610da73f75c5e25b09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.19.0/rex-amq-adapter_0.19.0_linux_arm64.tar.gz"
      sha256 "1144c485b2e12ec8a2d7a5d1ed189f140805ca61ac19c69b299f8e6ac2ce223f"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.19.0/rex-amq-adapter_0.19.0_linux_amd64.tar.gz"
      sha256 "0f6d72786f002923c04382e889edf98e820e52fbf72e116720418e67ad4b0b8c"
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
