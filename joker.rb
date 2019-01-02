class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.11.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.11.0/joker-0.11.0-linux-amd64.zip"
    sha256 "3ef3c636faf951a861c8c622c35fd0c5f9f9c5afd783f5abc5b5ba5706792c0d"
  else
    url "https://github.com/candid82/joker/releases/download/v0.11.0/joker-0.11.0-mac-amd64.zip"
    sha256 "5852d6007dc4f6dda44e6858a0268c90fd97e3ec5948b3ef2323419391132e8b"
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
