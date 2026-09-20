class Dnsnap < Formula
  desc "Version control for public DNS records you need to keep"
  homepage "https://github.com/igorasantos/dnsnap"
  url "https://github.com/igorasantos/dnsnap/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2da001ce72245ae749d190d05aa97219a0085d5fa92e112466ea4e4ba2d2fbef"
  license "MIT"

  depends_on "bash"
  depends_on "bind"
  depends_on "jq"
  depends_on "libidn2"
  depends_on "whois"

  uses_from_macos "curl"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "dnsnap", shell_output("#{bin}/dnsnap 2>&1", 1)
  end
end
