class Dnsnap < Formula
  desc "Version control for public DNS records you need to keep"
  homepage "https://github.com/igorasantos/dnsnap"
  url "https://github.com/igorasantos/dnsnap/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "196e6d6813075c427d30d7dc0421ab8ab32f13ffe3d6d9f61bc7e02401d5459b"
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
