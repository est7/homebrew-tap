class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.16.0/rex-amq-adapter_0.16.0_darwin_arm64.tar.gz"
      sha256 "9021ae9e2738aa457f7430cb83dd552b462380726a9b8d91079ade9d458dd622"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.16.0/rex-amq-adapter_0.16.0_darwin_amd64.tar.gz"
      sha256 "32583876f21cfdc26804247bcb01ae36b01e53cb26559b57be0063c11d6efe12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.16.0/rex-amq-adapter_0.16.0_linux_arm64.tar.gz"
      sha256 "a6b9ae214ce34951a12869502e84743e865b012f804b151f1baf390b79b45213"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.16.0/rex-amq-adapter_0.16.0_linux_amd64.tar.gz"
      sha256 "f35c2304eb690096d9e72539be09f0b83307e16f5f4e69e59a42110658e06514"
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
