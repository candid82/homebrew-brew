class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.12.8"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.12.8/joker-0.12.8-linux-amd64.zip"
    sha256 "26b86b5ba5dde1478aaf638901fbfc1cf8267f1d24e07e354af3e6315a2683fd"
  else
    url "https://github.com/candid82/joker/releases/download/v0.12.8/joker-0.12.8-mac-amd64.zip"
    sha256 "b8e625ea3096bd228a6ab38df300ff69cc149fab3e5c4249b506078dc7f3b9fd"
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
