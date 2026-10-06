class Fuckinggen < Formula
  desc "Generate images through your ChatGPT subscription from the terminal"
  homepage "https://github.com/prophesourvolodymyr/fuckinggen"
  url "https://github.com/prophesourvolodymyr/fuckinggen/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "101ebe9a5ec4a8a6c7a2c299904d75c91f1c8611ff3db7906338159c145f6cbd"
  license "WTFPL"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    (share/"fgen").install "install.sh"
    (share/"fgen/skills/gpt-image-gen-latest").install "skills/gpt-image-gen-latest/SKILL.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fgen --version")
  end
end
