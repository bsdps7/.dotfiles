#!/bin/sh

## Quit System Preferences
osascript -e 'tell application "System Preferences" to quit'

## Ask for the administrator password upfront
sudo -v

## Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

##==============================================================================
## General
##==============================================================================

## Set computer name
sudo scutil --set ComputerName "ddjw-mbp"
sudo scutil --set HostName "ddjw-mbp"
sudo scutil --set LocalHostName "ddjw-mbp"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "ddjw-mbp"

## Change color settings
defaults write -g AppleHighlightColor -string "1.000000 0.749020 0.823529 Pink"
defaults write -g AppleAccentColor -int 6 # pink

## Enable keyboard UI mode
defaults write -g AppleKeyboardUIMode -int 2

## Turn off reduce transparency option
defaults write com.apple.universalaccess reduceTransparency -bool false

## Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

## Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

## Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

## Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

## Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

## Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

## Disable smart dashes
#defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

## Disable automatic period substitution
#defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

## Disable crash reporter
defaults write com.apple.CrashReporter DialogType none

## Enable font smoothing
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

## Save screenshots to ~/Pictures/Screenshots
[[ -d ~/Pictures/Screenshots ]] || mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots

##==============================================================================
## Menu Bar
##==============================================================================

## Autohide menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

## Show day of week, date, and digital time in menu bar
defaults write com.apple.menuextra.clock DateFormat "EEE MMM d  h:mm a"
defaults write com.apple.menuextra.clock IsAnalog -bool false

## Show battery percentage in menu bar
defaults write com.apple.menuextra.battery ShowPercent "YES"

## Show AirPlay icon in menu bar
defaults write com.apple.airplay showInMenuBarIfPresent -bool true

## Hide text input mode name in menu bar
defaults write com.apple.menuextra.textinput ModeNameVisible -bool false

## Show clock, battery, airport, bluetooth, and airplay in menu bar
defaults write com.apple.systemuiserver menuExtras -array
#defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/Clock.menu"
#defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/Battery.menu"
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/AirPort.menu"
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/Displays.menu"
defaults write com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.clock" "100.0859"
defaults write com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.battery" "237.5469"
defaults write com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.airport" "307.0977"
defaults write com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.bluetooth" "339.9844"
defaults write com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.airplay" "373"

##==============================================================================
## Dock
##==============================================================================

## Automatically hide and show Dock
defaults write com.apple.dock autohide -bool true

## Do not show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

## Show only open applications in Dock
defaults write com.apple.dock static-only -bool true

##==============================================================================
## Finder
##==============================================================================

## Allow quitting Finder; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

## New Finder window show Home
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

## Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

## Show path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

## Search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

## Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

## Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

## Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

## Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

## Disable the warning when changing a file extension
#defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

## Disable Finder animations which might conflict with yabai
defaults write com.apple.finder DisableAllAnimations -bool true

##==============================================================================
## Mission Control & Spaces
##==============================================================================

## Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

## Speed up Mission Control animations
run defaults write com.apple.dock expose-animation-duration -float 0.1

##==============================================================================
## Input
##==============================================================================

## Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

## Set click force to light
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0

## Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

## Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

## Set language, formats, and input sources
defaults write NSGlobalDomain AppleLanguages -array "en-US" "ko-US"
defaults write NSGlobalDomain AppleLocale -string "en_US"
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true
defaults write com.apple.HIToolbox AppleEnabledInputSources -array '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>0</integer><key>KeyboardLayout Name</key><string>U.S.</string></dict>' '<dict><key>Bundle ID</key><string>com.apple.inputmethod.EmojiFunctionRowItem</string><key>InputSourceKind</key><string>Non Keyboard Input Method</string></dict>'
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>Bundle ID</key><string>com.apple.inputmethod.Korean</string><key>Input Mode</key><string>com.apple.inputmethod.Korean.2SetKorean</string><key>InputSourceKind</key><string>Input Mode</string></dict>' '<dict><key>Bundle ID</key><string>com.apple.inputmethod.Korean</string><key>InputSourceKind</key><string>Keyboard Input Method</string></dict>'

##==============================================================================
## Safari
##==============================================================================

## Privacy: don’t send search queries to Apple
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool true

## Privacy: don't send diagnostic logging to Apple
defaults write com.apple.Safari diagnosticLoggingEnabled -bool false

##==============================================================================
## Activity Monitor
##==============================================================================

## Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

##==============================================================================
## Spotlight & Siri
##==============================================================================

## Change indexing order and disable some search results
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "FONTS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 0;"name" = "DIRECTORIES";}' \
	'{"enabled" = 0;"name" = "PDF";}' \
	'{"enabled" = 0;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

## Disable Spotlight Suggestions in Lookup
defaults write com.apple.lookup.shared LookupSuggestionsDisabled -bool true

## Hide Siri from menu bar
defaults write com.apple.Siri StatusMenuVisible -bool false

##==============================================================================
## Shortcuts
##==============================================================================

## Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

##==============================================================================
## Shortcuts
##==============================================================================

## Disable Spotlight shortcut
#/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:64:enabled false"

## Disable Finder shortcut
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:65:enabled false"

## Disable Dock shortcut
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:52:enabled false"

## Disable Mission Control shortcuts
#/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:118:enabled false"
#/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:119:enabled false"
#/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:120:enabled false"
#/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:121:enabled false"
#/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:122:enabled false"
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:79:enabled false"
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:80:enabled false"
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:81:enabled false"
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:82:enabled false"

##==============================================================================
## End
##==============================================================================

## Kill affected applications
killall "Activity Monitor" "cfprefsd" "Dock" "Finder" "Safari" "SystemUIServer"
