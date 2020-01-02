 #!/usr/bin/env zsh

# Quit System Preferences
osascript -e 'tell application "System Preferences" to quit'

# Ask for administrator password upfront
sudo -v

#===============================================================================
# General
#===============================================================================

# Set computer name
sudo scutil --set ComputerName "lefa"
sudo scutil --set HostName "lefa"
sudo scutil --set LocalHostName "lefa"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "lefa"

# Show battery percentage in menu bar
defaults write com.apple.menuextra.battery ShowPercent YES

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Save screenshots to ~/Pictures/Screenshots
[[ -d ~/Pictures/Screenshots ]] || mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots

#===============================================================================
# Dock
#===============================================================================

# Automatically hide and show Dock
defaults write com.apple.dock autohide -bool true

# Not show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Show only open applications in Dock
defaults write com.apple.dock static-only -bool true

#===============================================================================
# Finder
#===============================================================================

# New Finder window show Home
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

#===============================================================================
# Input
#===============================================================================

# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Set click force to light
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0

# Set language, formats, and input sources
defaults write NSGlobalDomain AppleLanguages -array "en-US" "ko-US"
defaults write NSGlobalDomain AppleLocale -string "en_US"
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true
defaults write com.apple.HIToolbox AppleEnabledInputSources -array '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>0</integer><key>KeyboardLayout Name</key><string>U.S.</string></dict>' '<dict><key>Bundle ID</key><string>com.apple.inputmethod.EmojiFunctionRowItem</string><key>InputSourceKind</key><string>Non Keyboard Input Method</string></dict>'
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>Bundle ID</key><string>com.apple.inputmethod.Korean</string><key>Input Mode</key><string>com.apple.inputmethod.Korean.2SetKorean</string><key>InputSourceKind</key><string>Input Mode</string></dict>' '<dict><key>Bundle ID</key><string>com.apple.inputmethod.Korean</string><key>InputSourceKind</key><string>Keyboard Input Method</string></dict>'

#===============================================================================
# End
#===============================================================================

# Kill affected applications
killall SystemUIServer Dock Finder cfprefsd

# Restart the system
osascript -e 'tell app "loginwindow" to «event aevtrrst»'