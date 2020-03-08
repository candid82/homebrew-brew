class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.15.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.15.0/joker-0.15.0-linux-amd64.zip"
    sha256 "edc012cce69fdefeec36d044201d20271293edaae9cfee0080b971b0bf4eed56"
  else
    url "https://github.com/candid82/joker/releases/download/v0.15.0/joker-0.15.0-mac-amd64.zip"
    sha256 "4f858c6a5bca0fd46f6f914ec245568cbbc6165118120484d93b4ba06fc5eb19"
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
