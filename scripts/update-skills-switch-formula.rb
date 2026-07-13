# frozen_string_literal: true

module SkillsSwitchFormula
  REPOSITORY = "est7/skills-switch-tui"
  TARGETS = %w[darwin_arm64 darwin_amd64 linux_arm64 linux_amd64].freeze

  module_function

  def render(tag, checksum_text)
    match = tag.match(/\Av(\d+\.\d+\.\d+(?:[-+][0-9A-Za-z.-]+)?)\z/)
    raise ArgumentError, "invalid release tag: #{tag}" unless match

    version = match[1]
    checksums = parse_checksums(checksum_text)
    assets = TARGETS.to_h do |target|
      filename = "skills-switch_#{version}_#{target}.tar.gz"
      checksum = checksums.fetch(filename) { raise ArgumentError, "missing checksum for #{filename}" }
      [target, { filename: filename, checksum: checksum }]
    end

    <<~RUBY
      class SkillsSwitch < Formula
        desc "Manage Agent Skills, MCP servers, and system prompts from a terminal UI"
        homepage "https://github.com/#{REPOSITORY}"
        version "#{version}"

        on_macos do
          on_arm do
            url "#{asset_url(tag, assets.fetch("darwin_arm64")[:filename])}"
            sha256 "#{assets.fetch("darwin_arm64")[:checksum]}"
          end

          on_intel do
            url "#{asset_url(tag, assets.fetch("darwin_amd64")[:filename])}"
            sha256 "#{assets.fetch("darwin_amd64")[:checksum]}"
          end
        end

        on_linux do
          on_arm do
            url "#{asset_url(tag, assets.fetch("linux_arm64")[:filename])}"
            sha256 "#{assets.fetch("linux_arm64")[:checksum]}"
          end

          on_intel do
            url "#{asset_url(tag, assets.fetch("linux_amd64")[:filename])}"
            sha256 "#{assets.fetch("linux_amd64")[:checksum]}"
          end
        end

        def install
          bin.install "skills-switch"
        end

        test do
          assert_match version.to_s, shell_output("\#{bin}/skills-switch version")
        end
      end
    RUBY
  end

  def parse_checksums(checksum_text)
    checksum_text.each_line.to_h do |line|
      checksum, filename = line.split
      unless checksum&.match?(/\A[0-9a-f]{64}\z/) && filename
        raise ArgumentError, "malformed checksum line: #{line.inspect}"
      end

      [filename, checksum]
    end
  end

  def asset_url(tag, filename)
    "https://github.com/#{REPOSITORY}/releases/download/#{tag}/#{filename}"
  end
end

if $PROGRAM_NAME == __FILE__
  unless ARGV.length == 3
    warn "usage: #{$PROGRAM_NAME} <tag> <checksums.txt> <formula.rb>"
    exit 2
  end

  tag, checksum_path, formula_path = ARGV
  contents = SkillsSwitchFormula.render(tag, File.read(checksum_path))
  temporary_path = "#{formula_path}.tmp"
  File.write(temporary_path, contents)
  File.rename(temporary_path, formula_path)
end
