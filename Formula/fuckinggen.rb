class Fuckinggen < Formula
  desc "Generate images through your ChatGPT subscription from the terminal"
  homepage "https://github.com/prophesourvolodymyr/fuckinggen"
  url "https://github.com/prophesourvolodymyr/fuckinggen/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "f43e432730b6f85f889c33666a4543b60e398b0aafc6ebe2c0fd8315a5317a11"
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
