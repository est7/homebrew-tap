class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.11/rex-amq-adapter_0.9.11_darwin_arm64.tar.gz"
      sha256 "4f917950a4745909c6d182bb29c887a86dd5aab7b2f960aea5a6b01e4ef9d329"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.11/rex-amq-adapter_0.9.11_darwin_amd64.tar.gz"
      sha256 "da494fd86cf71dec903fd57cea3f3ed3722ae4aae2495a8040f5c9f2865ffdc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.11/rex-amq-adapter_0.9.11_linux_arm64.tar.gz"
      sha256 "37b557fb0ebbca642ff9f3404752c23569f6a1408104785700b84ca13c5f194a"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.11/rex-amq-adapter_0.9.11_linux_amd64.tar.gz"
      sha256 "449d14f9d0e2e042dc673992f334141cfaa8e9864c4781a4f6faaf1c22cd22fd"
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
