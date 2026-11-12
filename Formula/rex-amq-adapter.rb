class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.14.0/rex-amq-adapter_0.14.0_darwin_arm64.tar.gz"
      sha256 "1fc84ae495cf24b12b00fbb35214e1dace68a78ca723bee780f541f6b73e59d6"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.14.0/rex-amq-adapter_0.14.0_darwin_amd64.tar.gz"
      sha256 "8358498f46cafea2912b9077d593aa6748f34e51ca5bfea59e4546aebd5e301b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.14.0/rex-amq-adapter_0.14.0_linux_arm64.tar.gz"
      sha256 "26a62f74b1447741dab91dacc9bc6f30677382e7fce2dc3c1f59eb0ccd549b9c"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.14.0/rex-amq-adapter_0.14.0_linux_amd64.tar.gz"
      sha256 "7abfb4c3ca14160756fcb199ed00594169066b61f0bd97401953beb157e2f348"
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
