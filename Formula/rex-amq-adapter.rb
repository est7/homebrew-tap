class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.14/rex-amq-adapter_0.9.14_darwin_arm64.tar.gz"
      sha256 "e804f252c8c9f378547892825dfd3f705ec527f663347eadeb76ebc0590b6b8d"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.14/rex-amq-adapter_0.9.14_darwin_amd64.tar.gz"
      sha256 "b4dd5f0d7274b555f9c45950d42eeea881ceec2f35b1a686b1f92652fee38c29"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.14/rex-amq-adapter_0.9.14_linux_arm64.tar.gz"
      sha256 "ecb76c8fd3dd4931e31abc968c4fee0e5ff589ee966b04280a4d7d9bd821ead5"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.14/rex-amq-adapter_0.9.14_linux_amd64.tar.gz"
      sha256 "abf2c242789840cc179fce181c366a4e071d1bd1afe8ec80129e85c7ad42d642"
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
