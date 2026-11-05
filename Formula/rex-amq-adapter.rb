class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.8.1/rex-amq-adapter_0.8.1_darwin_arm64.tar.gz"
      sha256 "1db429dca6e8f00473704e3cf48cd9e2c7cac3d9eaf436d179b104585b247522"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.8.1/rex-amq-adapter_0.8.1_darwin_amd64.tar.gz"
      sha256 "d13602c08861c094f8e4bc0908d008aae7bfe417a0d5d7289761cc21e3e78531"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.8.1/rex-amq-adapter_0.8.1_linux_arm64.tar.gz"
      sha256 "c72dbd38cc73a0b81282fe63e4fd842a6cc8b92d3d35740623700d5f3fb42663"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.8.1/rex-amq-adapter_0.8.1_linux_amd64.tar.gz"
      sha256 "45779c86ec4cac6fabbb73d9ee4168a45104d768137e4e008a44f39d099dc0db"
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
