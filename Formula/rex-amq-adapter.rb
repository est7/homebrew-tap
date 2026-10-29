class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.3.0/rex-amq-adapter_0.3.0_darwin_arm64.tar.gz"
      sha256 "676b8fcafcbc5bf9c99c204b074e550a8e94c9d62cf7bb7a8ad97e9711724c77"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.3.0/rex-amq-adapter_0.3.0_darwin_amd64.tar.gz"
      sha256 "6427819fbe5714b95b3a47726135386f5590ba8034719eebad4bfe485a7c8112"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.3.0/rex-amq-adapter_0.3.0_linux_arm64.tar.gz"
      sha256 "f751603c890efa3e7b9a5cc10ff977c8a8ffc2642d5dff2755a877743e2dc3cc"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.3.0/rex-amq-adapter_0.3.0_linux_amd64.tar.gz"
      sha256 "28eca2ade11cefb4e13fd94f7b476eceba7132d3698d7ec8ec1c1a5a70a50525"
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
