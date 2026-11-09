class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.3/rex-amq-adapter_0.9.3_darwin_arm64.tar.gz"
      sha256 "33b53c7219530403a5711331f907d1596436bcfc49007cbb8ce85c50b4c2e299"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.3/rex-amq-adapter_0.9.3_darwin_amd64.tar.gz"
      sha256 "db260f41465fd1fd14fa9ed3d3b44a02f8e1af395aae9b1801fe09acde08627b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.3/rex-amq-adapter_0.9.3_linux_arm64.tar.gz"
      sha256 "f78d79102885bbf08b06459a918aac417c789d760d21294efc00b4ffb9b521cb"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.3/rex-amq-adapter_0.9.3_linux_amd64.tar.gz"
      sha256 "741b19f2a675b66a6e8f2484851f56a0fbe7bd5a1d7e8a97e443241b3cd9b570"
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
