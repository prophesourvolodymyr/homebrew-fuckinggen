class Fuckinggen < Formula
  desc "Generate images through your ChatGPT subscription from the terminal"
  homepage "https://github.com/OFFICIAL-WTF/fuckinggen"
  url "https://github.com/OFFICIAL-WTF/fuckinggen/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "31ea5ce0d8eefc9862a4440ee6d5a6529a80ab4e4e12de139f7e0db489555046"
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
