class Onepile < Formula
  desc "OnePile.app command-line tool"
  homepage "https://onepile.app"
  url "https://github.com/holtwick/onepile.git",
    :tag => "0.2.0", :revision => "1ab5c1b416b074e2815bdf62be731fc2fb889eb4"
  head "https://github.com/holtwick/onepile.git"
  version "0.2.0"

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "#{bin}/onepile", "--version"
  end
end
