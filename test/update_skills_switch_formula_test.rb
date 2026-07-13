# frozen_string_literal: true

require "minitest/autorun"
require_relative "../scripts/update-skills-switch-formula"

class UpdateSkillsSwitchFormulaTest < Minitest::Test
  CHECKSUMS = <<~TEXT
    #{"a" * 64}  skills-switch_0.2.0_darwin_arm64.tar.gz
    #{"b" * 64}  skills-switch_0.2.0_darwin_amd64.tar.gz
    #{"c" * 64}  skills-switch_0.2.0_linux_arm64.tar.gz
    #{"d" * 64}  skills-switch_0.2.0_linux_amd64.tar.gz
  TEXT

  def test_renders_all_supported_archives
    formula = SkillsSwitchFormula.render("v0.2.0", CHECKSUMS)

    assert_includes formula, 'version "0.2.0"'
    assert_includes formula, "skills-switch_0.2.0_darwin_arm64.tar.gz"
    assert_includes formula, "skills-switch_0.2.0_linux_amd64.tar.gz"
    assert_includes formula, "d" * 64
    assert_includes formula, 'shell_output("#{bin}/skills-switch version")'
  end

  def test_rejects_missing_archive_checksum
    error = assert_raises(ArgumentError) do
      SkillsSwitchFormula.render("v0.2.0", CHECKSUMS.lines.first)
    end

    assert_includes error.message, "missing checksum"
  end

  def test_rejects_invalid_release_tag
    assert_raises(ArgumentError) do
      SkillsSwitchFormula.render("latest", CHECKSUMS)
    end
  end
end
