class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.15.7"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.15.7/joker-0.15.7-linux-amd64.zip"
    sha256 "e31b205b8a3eaf82d5696c5df1628690cfb40e51459d4174cc9f011c459571e7"
  else
    url "https://github.com/candid82/joker/releases/download/v0.15.7/joker-0.15.7-mac-amd64.zip"
    sha256 "b23ba0f0b45efb5dd5f7381c0f8bb0d57603ab4a03d698d87c6de8741ca45b26"
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
