class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.14.1"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.14.1/joker-0.14.1-linux-amd64.zip"
    sha256 "b3049036d0c0032b0b8668d3c56e0a2a75e15324b60750b4ec6b7a8300386220"
  else
    url "https://github.com/candid82/joker/releases/download/v0.14.1/joker-0.14.1-mac-amd64.zip"
    sha256 "f7ea11eea9618a917073d5a72c8c722283142ef5ef88533991823ecf444449ae"
  end

  bottle :unneeded

  def install
    bin.install "joker"
  end

  test do
    testfile = testpath/"test.clj"
    testfile.write "(let [x 1] (println 42))"

    assert_match "Parse warning: unused binding: x",
      shell_output("#{bin}/joker --lint --dialect clj #{testfile} 2>&1")
  end
end
