class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.8.9"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.8.9/joker-0.8.9-linux-amd64.zip"
    sha256 "8aa41cdcbb7f1a561fc361b8f20a3862eac868f4ebfd260c96ed5e798812df97"
  else
    url "https://github.com/candid82/joker/releases/download/v0.8.9/joker-0.8.9-mac-amd64.zip"
    sha256 "fbeee960d8f54e8b9fe1e310bf3a3b2dfad2c25b2e41b9f5b2c3ef6bece2f95d"
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
