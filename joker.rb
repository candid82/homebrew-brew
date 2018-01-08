class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.8.8"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.8.8/joker-0.8.8-linux-amd64.zip"
    sha256 "ccb6698c6e81be6de59254797e7bc6a0888c00618c5a42d22ac75e142a172715"
  else
    url "https://github.com/candid82/joker/releases/download/v0.8.8/joker-0.8.8-mac-amd64.zip"
    sha256 "34a8deb78318bb29d98a08da96dd3b8b13e94b7154717b2d42513c3e6a19b2c8"
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
