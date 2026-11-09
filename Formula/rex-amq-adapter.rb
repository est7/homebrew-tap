class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.4/rex-amq-adapter_0.9.4_darwin_arm64.tar.gz"
      sha256 "e6422b3fc27483913e4def6dcd776b1da40ff8dc7d0236d66191bcf8144a9dbb"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.4/rex-amq-adapter_0.9.4_darwin_amd64.tar.gz"
      sha256 "ceb431e9c5a4948127c8ee48a1fd9ab7dac12abc3b93f3a9c45e33711d1151be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.4/rex-amq-adapter_0.9.4_linux_arm64.tar.gz"
      sha256 "29ad38ee4d094359ebe61df2743ecb10711e96bcc681e292b119d0da2910aa32"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.4/rex-amq-adapter_0.9.4_linux_amd64.tar.gz"
      sha256 "76bb93e40cac0b8ec7ccef779475645f90f89480a50ccbdb237302f0c8745ab7"
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
