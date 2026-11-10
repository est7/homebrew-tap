class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.8/rex-amq-adapter_0.9.8_darwin_arm64.tar.gz"
      sha256 "9fbca09a58b209df5e436861c8a209e5dc10456d25bb72f84a06d05516328e95"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.8/rex-amq-adapter_0.9.8_darwin_amd64.tar.gz"
      sha256 "068725938ee5838d098ed46f69a03e783927063840c9af4d6ba80635d3189082"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.8/rex-amq-adapter_0.9.8_linux_arm64.tar.gz"
      sha256 "f37c7e1413ad7a2c8d19eca4b35c29daf39d46f42350e26b0159f2aa02487128"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.8/rex-amq-adapter_0.9.8_linux_amd64.tar.gz"
      sha256 "fb3252b91579f55714093a12d50803f257201cb043ab38318dcbce9a32488e6a"
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
