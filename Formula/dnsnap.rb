class Dnsnap < Formula
  desc "Version control for public DNS records you need to keep"
  homepage "https://github.com/igorasantos/dnsnap"
  url "https://github.com/igorasantos/dnsnap/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "56785d54e3e1fb317d35411d2c983e6b3a8e67362c27d5bc44c00d47ce17f574"
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
