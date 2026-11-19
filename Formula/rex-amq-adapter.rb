class RexAmqAdapter < Formula
  desc "Coding agents in Rex terminals message each other over AMQ"
  homepage "https://github.com/est7/rex-amq-adapter"
  license "MIT"

  depends_on "avivsinai/tap/amq"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.25.0/rex-amq-adapter_0.25.0_darwin_arm64.tar.gz"
      sha256 "c25b3d5bfe4dc255c7d37dbac63f1e4e49340c854164ee239ed1d352d91f3633"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.25.0/rex-amq-adapter_0.25.0_darwin_amd64.tar.gz"
      sha256 "35ce6dfa09c460adc6b68693ea62843dce4a5530e0262fb26e49bfed44d4123f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.25.0/rex-amq-adapter_0.25.0_linux_arm64.tar.gz"
      sha256 "b747196aa6420976f9e4ddaa3557eb07888136458599394820b130b5215983cb"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-adapter/releases/download/v0.25.0/rex-amq-adapter_0.25.0_linux_amd64.tar.gz"
      sha256 "e2a28d122c17911b97db40bb48e9696873b0b43931ecdaa20e19e77b13bc9c78"
    end
  end

  def install
    bin.install "rex-amq-adapter"
  end

  def caveats
    <<~EOS
      Install the skill and hooks for every agent found (Claude Code, Codex,
      Antigravity, Pi):
        rex-amq-adapter install setup

      Start Codex with --no-daemon so its hooks and tools inherit the Rex pane environment.
      Codex runs new hooks only after you approve them with /hooks.
      Upgrades keep the hooks current: they run #{opt_bin}/rex-amq-adapter.
      If `rex-amq-adapter install status` reports anything outdated (such as the
      SKILL.md stubs or Pi extension), run `rex-amq-adapter install setup` again.
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/rex-amq-adapter version --text")
    assert_match "mail", shell_output("#{bin}/rex-amq-adapter skill list --text")
  end
end
