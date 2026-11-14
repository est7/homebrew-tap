class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.15.0/rex-amq-adapter_0.15.0_darwin_arm64.tar.gz"
      sha256 "703bd72bc1a9e7eb1754f5bba2563f81bf3bd08a6a2b0e3cf9abc732e8f10092"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.15.0/rex-amq-adapter_0.15.0_darwin_amd64.tar.gz"
      sha256 "eddf06c341d4e17d7f26e8742492c3a5560ccb1a62e83480d1f92d3df903ae57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.15.0/rex-amq-adapter_0.15.0_linux_arm64.tar.gz"
      sha256 "20fc61ba33834d1af8cc0a580d55c57ca2d9442cba444ea474ec726b2cc26246"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.15.0/rex-amq-adapter_0.15.0_linux_amd64.tar.gz"
      sha256 "dbf39d5278021d816d9a66942e80db1c35f6c2cad17c538648ca4eb1426e4d61"
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
