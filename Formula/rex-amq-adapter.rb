class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.1.2/rex-amq-adapter_0.1.2_darwin_arm64.tar.gz"
      sha256 "dd8559997f884fb4d37bae3099f9c3258db5b5793000a7d44cced12909832af5"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.1.2/rex-amq-adapter_0.1.2_darwin_amd64.tar.gz"
      sha256 "bf95da490273984b94ada17875eb9418f531e3b4603d2cad93cf03d00e5d5063"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.1.2/rex-amq-adapter_0.1.2_linux_arm64.tar.gz"
      sha256 "747bc8d6cd58fb195f3878a935a9f66961611d219c29736ca4854523f3956965"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.1.2/rex-amq-adapter_0.1.2_linux_amd64.tar.gz"
      sha256 "5c0f9fe05c7e95f24061193496b1a0739486f87b85b760d3934515dcf27ef369"
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
      Upgrades need no second setup: the hooks run #{opt_bin}/rex-amq-adapter.
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/rex-amq-adapter version")
    assert_match "rex-amq-adapter", shell_output("#{bin}/rex-amq-adapter __internal skill")
  end
end
