class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.10.0/rex-amq-adapter_0.10.0_darwin_arm64.tar.gz"
      sha256 "be906bb583ffc13667c74e93893b33731cf152502cf66ced62c022d725d8547a"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.10.0/rex-amq-adapter_0.10.0_darwin_amd64.tar.gz"
      sha256 "549f7e9c265ecf29f938dd3b85dc9f444bde307e330847e89c17bc681f3a51fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.10.0/rex-amq-adapter_0.10.0_linux_arm64.tar.gz"
      sha256 "fc065081c2a03c3eeec77018864645975154d6cc7e964ed9378eaf1bfbd6284e"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.10.0/rex-amq-adapter_0.10.0_linux_amd64.tar.gz"
      sha256 "c8ff7931924a264df7bf53590ff311900a0845ad1eb2cc0da62b103f2e6c299a"
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
