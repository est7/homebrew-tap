class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.12/rex-amq-adapter_0.9.12_darwin_arm64.tar.gz"
      sha256 "a3078f5ff4ca7ada2700c30e52a80b70470924e4ea523ee55332de91f9922334"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.12/rex-amq-adapter_0.9.12_darwin_amd64.tar.gz"
      sha256 "d1bff3f26d0db16ff7199b7e0b3f4051b017718bf923d398062f6531f13c2b85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.12/rex-amq-adapter_0.9.12_linux_arm64.tar.gz"
      sha256 "de129b400885cee16da1a46023ff25f1665a00b3eb82d24cb35b3dcd5a51ddfe"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.9.12/rex-amq-adapter_0.9.12_linux_amd64.tar.gz"
      sha256 "f3ffcc9ea23cca331dd56081bb0d10a7135e83101503ba6ace9f9e7a17876cfc"
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
