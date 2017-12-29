class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.8.7"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.8.7/joker-0.8.7-linux-amd64.zip"
    sha256 "a9b82ea38cb2090a06024c1c61a9b771931b8c9d685a2bf1d06ac4fd7fa16eb2"
  else
    url "https://github.com/candid82/joker/releases/download/v0.8.7/joker-0.8.7-mac-amd64.zip"
    sha256 "7cf467c14a4f38bd2f5d222968c62a31b37e37ef86388b8e215b51f7e07d1343"
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
