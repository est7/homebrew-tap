class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.2/rex-amq-adapter_0.9.2_darwin_arm64.tar.gz"
      sha256 "a25268658b61027db195d8babab32c07d0892c7e3cbdb38009babec92a3d6787"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.2/rex-amq-adapter_0.9.2_darwin_amd64.tar.gz"
      sha256 "6e4b05ea51b1c3a6d36eb9862f8e384c93136e7240dbab742774127d1d783755"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.2/rex-amq-adapter_0.9.2_linux_arm64.tar.gz"
      sha256 "18075c41081748fba6e18148a6482f3deba3b100c145d1edfce00176f648dd78"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.2/rex-amq-adapter_0.9.2_linux_amd64.tar.gz"
      sha256 "6e59cf8edccab6959441a1e9293fcd4065e64b3700b3dd00acbc12d79ab5a6a0"
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
