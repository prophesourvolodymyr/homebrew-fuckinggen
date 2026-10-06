class Fuckinggen < Formula
  desc "Generate images through your ChatGPT subscription from the terminal"
  homepage "https://github.com/prophesourvolodymyr/fuckinggen"
  url "https://github.com/prophesourvolodymyr/fuckinggen/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "76de50dbea004706a869ded134fc604fd7583efbe9a427fd870ac588a67ede72"
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
