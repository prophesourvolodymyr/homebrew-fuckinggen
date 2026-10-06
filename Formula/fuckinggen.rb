class Fuckinggen < Formula
  desc "Generate images through your ChatGPT subscription from the terminal"
  homepage "https://github.com/prophesourvolodymyr/fuckinggen"
  url "https://github.com/prophesourvolodymyr/fuckinggen/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "615039532add379c587421c26a70d785811c4a5b4ff443252b2610064cbf0185"
  license "WTFPL"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/fgen --version")
  end
end
