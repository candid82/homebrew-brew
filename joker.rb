class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.9.5"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.9.5/joker-0.9.5-linux-amd64.zip"
    sha256 "b1d7e1493e004e9422e9a2b4f5f73eeadd360e7cb1432a1a068e46dc9adbf87c"
  else
    url "https://github.com/candid82/joker/releases/download/v0.9.5/joker-0.9.5-mac-amd64.zip"
    sha256 "9c62313ba32b9176a5307c8a602c8b594f4c38526958099f3fd82b8dc6e1b3b5"
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
