class RexAmqUi < Formula
  desc "Floating Crew and Epics cockpit panel for Rex sessions over AMQ"
  homepage "https://github.com/est7/rex-amq-ui"
  license "MIT"

  depends_on "est7/tap/rex-amq-adapter"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-ui/releases/download/v0.2.0/rex-amq-ui_0.2.0_darwin_arm64.tar.gz"
      sha256 "805e238c48e0ae7300950dc3c34395d12c037585bd33179688a0736c29f3dcfc"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-ui/releases/download/v0.2.0/rex-amq-ui_0.2.0_darwin_amd64.tar.gz"
      sha256 "cf88e83a370a6e1aaf532cfe6cd0f3935af03b3a278a41e553502f0b90c09a1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-ui/releases/download/v0.2.0/rex-amq-ui_0.2.0_linux_arm64.tar.gz"
      sha256 "ac98e18f503b6ee8be9537f31816eab8b18d55f3e5ce0a47fbd0e6bbba860354"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-ui/releases/download/v0.2.0/rex-amq-ui_0.2.0_linux_amd64.tar.gz"
      sha256 "043792a1982d6cba279ad1a556f1c4f6c4d026be5944e35fe85ca514252ec383"
    end
  end

  def install
    bin.install "rex-amq-ui"
    pkgshare.install "lua/rex-amq-ui/init.lua", "lua/rex-amq-ui/tests"
  end

  def caveats
    <<~EOS
      Load the plugin from your Rex init.lua (~/.config/rex/init.lua by default):
        dofile("#{opt_pkgshare}/init.lua").setup{ toggle_key = "cmd+shift+a", waiting_key = "cmd+shift+u" }
      then run:
        rex config check && rex config reload
      Cmd+Shift+A toggles the floating panel; Cmd+Shift+U jumps to the agent waiting on you.
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/rex-amq-ui --version")
    assert_predicate pkgshare/"init.lua", :exist?
  end
end
