class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.9.7"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.9.7/joker-0.9.7-linux-amd64.zip"
    sha256 "94dd6840ad8fc9edf4374daea3b01beeddba098762ec8ede8dbd96018f8cca45"
  else
    url "https://github.com/candid82/joker/releases/download/v0.9.7/joker-0.9.7-mac-amd64.zip"
    sha256 "5750fd129b9d9130cc7defb79071ee8c8bc1ebae55a45ba98e4d6afcab978566"
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
