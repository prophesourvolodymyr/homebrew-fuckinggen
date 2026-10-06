class Fuckinggen < Formula
  desc "Generate images through your ChatGPT subscription from the terminal"
  homepage "https://github.com/prophesourvolodymyr/fuckinggen"
  url "https://github.com/prophesourvolodymyr/fuckinggen/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "82acb0515fd434f0fcd585d27ffe1930c58ad406cddaeebabeab74d4f4336f22"
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
