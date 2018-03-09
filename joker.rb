class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.9.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.9.0/joker-0.9.0-linux-amd64.zip"
    sha256 "c3e50e1c06336f4578d3742372cdda16ed1856b72711abb6ba874ce5fe237f76"
  else
    url "https://github.com/candid82/joker/releases/download/v0.9.0/joker-0.9.0-mac-amd64.zip"
    sha256 "d260b701904c21272d95ca09a4c36b371b52655d1addacb21b60b71ed5cfe25b"
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
