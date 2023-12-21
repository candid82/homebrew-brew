class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.3.3"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.3.3/joker-linux-amd64.zip"
    sha256 "01326bbb6f178d22b0cc30b043064c4da97c7965acba3159fac6582d19f44a5f"
  else
    url "https://github.com/candid82/joker/releases/download/v1.3.3/joker-mac-amd64.zip"
    sha256 "066d4adbffedbc1dd4f0a3a9ecb3d8f6f02c86e54b9f360fc2a503909c2d279c"
  end

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
