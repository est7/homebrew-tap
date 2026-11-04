class RexHistory < Formula
  desc "Rex pane history and coding-agent transcripts in a floating Neovim"
  homepage "https://github.com/est7/rex-history"
  url "https://github.com/est7/rex-history/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "404bb3a35c52f2daf3f9e633abc2da12f62bc01bc2d5f39b812183cf9c59280c"
  license "MIT"

  depends_on "neovim"

  def install
    pkgshare.install "init.lua", "view.lua", "transcripts.lua", "tests"
  end

  def caveats
    <<~EOS
      Load it from your Rex init.lua (~/.config/rex/init.lua by default):
        dofile("#{opt_pkgshare}/init.lua").setup()
      then run:
        rex config check && rex config reload
      Cmd+Shift+C opens the focused pane's history.
    EOS
  end

  test do
    system Formula["neovim"].opt_bin/"nvim", "--headless", "-u", "NONE", "-i", "NONE",
           "-l", pkgshare/"tests/run.lua"
  end
end
