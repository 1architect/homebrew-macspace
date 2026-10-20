cask "macspace" do
  version "1.1.4"
  sha256 "be96b30edb31c04d68809077e549893860f2fbb71a6ba76f0feb4d6ada75d302"

  url "https://github.com/1architect/macspace-releases/releases/download/v#{version}/MacSpace-#{version}.dmg"
  name "MacSpace"
  desc "System Data and Apple Intelligence cleaner"
  homepage "https://github.com/1architect/macspace-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  # MacSpace updates itself with Sparkle; brew upgrade still works for people who prefer it.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "MacSpace.app"

  # The privileged helper the app registers (Contents/Library/LaunchDaemons/com.macspace.helper.plist).
  uninstall launchctl: "com.macspace.helper",
            quit:      "com.macspace.app"

  # /Library/Application Support/MacSpace holds the originals Debloat restores: zap it only after "Enable all" (caveats).
  zap trash: [
    "/Library/Application Support/MacSpace",
    "~/Library/Application Support/MacSpace",
    "~/Library/Caches/com.macspace.app",
    "~/Library/HTTPStorages/com.macspace.app",
    "~/Library/Logs/MacSpace",
    "~/Library/Preferences/com.macspace.app.plist",
    "~/Library/Saved Application State/com.macspace.app.savedState",
  ]

  caveats <<~EOS
    If Debloat switched settings off, switch them back on in MacSpace before uninstalling,
    and remove the MacSpace profile in System Settings > General > Device Management.
  EOS
end
