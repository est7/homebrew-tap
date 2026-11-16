class RexAmqUi < Formula
  desc "Floating Crew and Epics cockpit panel for Rex sessions over AMQ"
  homepage "https://github.com/est7/rex-amq-ui"
  license "MIT"

  depends_on "est7/tap/rex-amq-adapter"

  on_macos do
    on_arm do
      url "https://github.com/est7/rex-amq-ui/releases/download/v0.1.0/rex-amq-ui_0.1.0_darwin_arm64.tar.gz"
      sha256 "1c4c0b0cc6f08a42baefc3ac824a3b52a4e0d91a631c14b4d96a9a17d463fb19"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-ui/releases/download/v0.1.0/rex-amq-ui_0.1.0_darwin_amd64.tar.gz"
      sha256 "d3dd25d3abba4fd482406d12a30b1085a9c43822cb2fbeeb2f6611cd38055ef5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/est7/rex-amq-ui/releases/download/v0.1.0/rex-amq-ui_0.1.0_linux_arm64.tar.gz"
      sha256 "5a3de6935236dae0ab7719c39f12a18cdfd78fcbfc9754cf428f1cedc71bc7b4"
    end

    on_intel do
      url "https://github.com/est7/rex-amq-ui/releases/download/v0.1.0/rex-amq-ui_0.1.0_linux_amd64.tar.gz"
      sha256 "02d158ec69f930a8c9876cfd9a172bf78648bb49ea4af884aa745d34f52ff3d5"
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
