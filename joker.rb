class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.12.1"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.12.1/joker-0.12.1-linux-amd64.zip"
    sha256 "b95f28e02956111e00491cd70f9e0ff675365ad4fa551b1d40ac8a8bc33510e6"
  else
    url "https://github.com/candid82/joker/releases/download/v0.12.1/joker-0.12.1-mac-amd64.zip"
    sha256 "05db16f7ed3bf41844145ff297295c0d4bf850d1d79fdea3b675e476ce97eb53"
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
