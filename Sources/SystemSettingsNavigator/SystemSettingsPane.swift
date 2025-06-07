import Foundation

@available(macOS 13.0, macCatalyst 16.0, *)
public enum SystemSettingsPane: Pane {
    case primary
    case appleID
    case family
    case wifi
    case bluetooth
    case network
    case vpn
    case notifications
    case sound
    case focus
    case screenTime
    case general(GeneralSettingsTab)
    case appearance
    case accessibility(AccessibilitySettingsTab)
    case controlCenter
    case siri
    case spotlight
    case privacySecurity(PrivacySecuritySettingsTab)
    case desktop
    case displays
    case wallpaper
    case screenSaver
    case battery
    case energySaver
    case lockScreen
    case touchIDAndPassword
    case usersAndGroups
    case passwords
    case internetAccounts
    case gameCenter
    case wallet
    case headphone
    case keyboard
    case trackpad
    case mouse
    case cdDVD
    case gameController
    case printersAndScanners

    public var urlSchema: String {
        switch self {
        case .primary:
            "x-apple.systempreferences:com.apple.preferences"
        case .appleID:
            "x-apple.systempreferences:com.apple.systempreferences.AppleIDSettings"
        case .family:
            "x-apple.systempreferences:com.apple.Family-Settings.extension"
        case .wifi:
            "x-apple.systempreferences:com.apple.wifi-settings-extension"
        case .bluetooth:
            "x-apple.systempreferences:com.apple.BluetoothSettings"
        case .network:
            "x-apple.systempreferences:com.apple.Network-Settings.extension"
        case .vpn:
            "x-apple.systempreferences:com.apple.NetworkExtensionSettingsUI.NESettingsUIExtension"
        case .notifications:
            "x-apple.systempreferences:com.apple.Notifications-Settings.extension"
        case .sound:
            "x-apple.systempreferences:com.apple.Sound-Settings.extension"
        case .focus:
            "x-apple.systempreferences:com.apple.Focus-Settings.extension"
        case .screenTime:
            "x-apple.systempreferences:com.apple.Screen-Time-Settings.extension"
        case let .general(generalSettingsTab):
            switch generalSettingsTab {
            case .primary:
                "x-apple.systempreferences:com.apple.systempreferences.GeneralSettings"
            case .about:
                "x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension"
            case .softwareUpdate:
                "x-apple.systempreferences:com.apple.Software-Update-Settings.extension"
            case .storage:
                "x-apple.systempreferences:com.apple.settings.Storage"
            case .airdropAndHandoff:
                "x-apple.systempreferences:com.apple.AirDrop-Handoff-Settings.extension"
            case .loginItems:
                "x-apple.systempreferences:com.apple.LoginItems-Settings.extension"
            case .appleCareAndWarranty:
                "x-apple.systempreferences:com.apple.Coverage-Settings.extension"
            case .languageAndRegion:
                "x-apple.systempreferences:com.apple.Localization-Settings.extension"
            case .DateAndTime:
                "x-apple.systempreferences:com.apple.Date-Time-Settings.extension"
            case .sharing:
                "x-apple.systempreferences:com.apple.Sharing-Settings.extension"
            case .timeMachine:
                "x-apple.systempreferences:com.apple.Time-Machine-Settings.extension"
            case .transferOrReset:
                "x-apple.systempreferences:com.apple.Transfer-Reset-Settings.extension"
            case .startupDisk:
                "x-apple.systempreferences:com.apple.Startup-Disk-Settings.extension"
            }
        case .appearance:
            "x-apple.systempreferences:com.apple.Appearance-Settings.extension"
        case let .accessibility(accessibilitySettingsTab):
            switch accessibilitySettingsTab {
            case .primary:
                "x-apple.systempreferences:com.apple.Accessibility-Settings.extension"
            case .voiceOver:
                "x-apple.systempreferences:com.apple.preference.universalaccess?Seeing_VoiceOver"
            case .zoom:
                "x-apple.systempreferences:com.apple.preference.universalaccess?Zoom"
            case .hoverText:
                "x-apple.systempreferences:com.apple.preference.universalaccess?HoverText"
            case .display:
                "x-apple.systempreferences:com.apple.preference.universalaccess?Seeing_Display"
            case .spokenContent:
                "x-apple.systempreferences:com.apple.preference.universalaccess?SpokenContent"
            case .descriptions:
                "x-apple.systempreferences:com.apple.preference.universalaccess?Descriptions"
            case .hearingDevices:
                "x-apple.systempreferences:com.apple.preference.universalaccess?Hearing"
            case .audio:
                "x-apple.systempreferences:com.apple.preference.universalaccess?Audio"
            case .rtt:
                "x-apple.systempreferences:com.apple.preference.universalaccess?RTT"
            case .captions:
                "x-apple.systempreferences:com.apple.preference.universalaccess?Captions"
            case .liveCaptions:
                "x-apple.systempreferences:com.apple.preference.universalaccess?LiveCaptions"
            case .voiceControl:
                "x-apple.systempreferences:com.apple.preference.universalaccess?VoiceControl"
            case .keyboard:
                "x-apple.systempreferences:com.apple.preference.universalaccess?Keyboard"
            case .pointerControl:
                "x-apple.systempreferences:com.apple.preference.universalaccess?Mouse"
            case .switchControl:
                "x-apple.systempreferences:com.apple.preference.universalaccess?Switch"
            case .liveSpeech:
                "x-apple.systempreferences:com.apple.preference.universalaccess?LiveSpeech"
            case .personalVoice:
                "x-apple.systempreferences:com.apple.preference.universalaccess?PersonalVoice"
            case .vocalShortcuts:
                "x-apple.systempreferences:com.apple.preference.universalaccess?VocalShortcuts"
            case .siri:
                "x-apple.systempreferences:com.apple.preference.universalaccess?Siri"
            case .shortcut:
                "x-apple.systempreferences:com.apple.preference.universalaccess?Shortcut"
            }
        case .controlCenter:
            "x-apple.systempreferences:com.apple.ControlCenter-Settings.extension"
        case .siri:
            "x-apple.systempreferences:com.apple.Siri-Settings.extension"
        case .spotlight:
            "x-apple.systempreferences:com.apple.Spotlight-Settings.extension"
        case let .privacySecurity(privacySecuritySettingsTab):
            switch privacySecuritySettingsTab {
            case .primary:
                "x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension"
            case .locationServices:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_LocationServices"
            case .contacts:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Contacts"
            case .calendars:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Calendars"
            case .reminders:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Reminders"
            case .photos:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Photos"
            case .bluetooth:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Bluetooth"
            case .microphone:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Microphone"
            case .camera:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Camera"
            case .motion:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Motion"
            case .homekit:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_HomeKit"
            case .speechRecognition:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_SpeechRecognition"
            case .media:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Media"
            case .filesFolders:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_FilesAndFolders"
            case .fullDiskAccess:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles"
            case .focus:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Focus"
            case .accessibility:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
            case .inputMonitoring:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_ListenEvent"
//            case .localNetwork:
//                "x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension?Privacy_LocalNetwork"
            case .screenRecording:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_ScreenCapture"
            case .passkeysAccess:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_PasskeyAccess"
            case .automation:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Automation"
            case .appManagement:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_AppBundles"
            case .developerTools:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_DevTools"
            case .sensitiveContentWarning:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_NudityDetection"
            case .analytics:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Analytics"
            case .advertising:
                "x-apple.systempreferences:com.apple.preference.security?Privacy_Advertising"
            case .fileVault:
                "x-apple.systempreferences:com.apple.preference.security?FileVault"
            case .lockdownMode:
                "x-apple.systempreferences:com.apple.preference.security?LockdownMode"
            case .extensions(let tab):
                if tab == .primary {
                    "x-apple.systempreferences:com.apple.ExtensionsPreferences"
                } else {
                    "x-apple.systempreferences:com.apple.ExtensionsPreferences?extensionPointIdentifier=\(tab.extensionPointIdentifier)"
                }
            case .profiles:
                "x-apple.systempreferences:com.apple.Profiles-Settings.extension"
            case .advanced:
                "x-apple.systempreferences:com.apple.preference.security?Advanced"
            }
        case .desktop:
            "x-apple.systempreferences:com.apple.Desktop-Settings.extension"
        case .displays:
            "x-apple.systempreferences:com.apple.Displays-Settings.extension"
        case .wallpaper:
            "x-apple.systempreferences:com.apple.Wallpaper-Settings.extension"
        case .screenSaver:
            "x-apple.systempreferences:com.apple.ScreenSaver-Settings.extension"
        case .battery:
            "x-apple.systempreferences:com.apple.Battery-Settings.extension"
        case .energySaver:
            "x-apple.systempreferences:com.apple.preferences.EnergySaverPrefPane"
        case .lockScreen:
            "x-apple.systempreferences:com.apple.Lock-Screen-Settings.extension"
        case .touchIDAndPassword:
            "x-apple.systempreferences:com.apple.Touch-ID-Settings.extension"
        case .usersAndGroups:
            "x-apple.systempreferences:com.apple.Users-Groups-Settings.extension"
        case .passwords:
            "x-apple.systempreferences:com.apple.Passwords-Settings.extension"
        case .internetAccounts:
            "x-apple.systempreferences:com.apple.Internet-Accounts-Settings.extension"
        case .gameCenter:
            "x-apple.systempreferences:com.apple.Game-Center-Settings.extension"
        case .wallet:
            "x-apple.systempreferences:com.apple.WalletSettingsExtension"
        case .headphone:
            "x-apple.systempreferences:com.apple.HeadphoneSettings"
        case .keyboard:
            "x-apple.systempreferences:com.apple.Keyboard-Settings.extension"
        case .trackpad:
            "x-apple.systempreferences:com.apple.Trackpad-Settings.extension"
        case .mouse:
            "x-apple.systempreferences:com.apple.Mouse-Settings.extension"
        case .cdDVD:
            "x-apple.systempreferences:com.apple.CD-DVD-Settings.extension"
        case .gameController:
            "x-apple.systempreferences:com.apple.Game-Controller-Settings.extension"
        case .printersAndScanners:
            "x-apple.systempreferences:com.apple.Print-Scan-Settings.extension"
        }
    }
}

@available(macOS 13.0, macCatalyst 16.0, *)
public enum GeneralSettingsTab {
    case primary
    case about
    case softwareUpdate
    case storage
    case airdropAndHandoff
    case loginItems
    @available(macOS 14.0, macCatalyst 17.0, *)
    case appleCareAndWarranty
    case languageAndRegion
    case DateAndTime
    case sharing
    case timeMachine
    case transferOrReset
    case startupDisk
}

@available(macOS 13.0, macCatalyst 16.0, *)
public enum AccessibilitySettingsTab {
    case primary
    case voiceOver
    case zoom
    @available(macOS 15.0, macCatalyst 18.0, *)
    case hoverText
    case display
    case spokenContent
    case descriptions
    @available(macOS 14.0, macCatalyst 17.0, *)
    case hearingDevices
    case audio
    @available(macOS 14.0, macCatalyst 17.0, *)
    case rtt
    case captions
    case liveCaptions
    case voiceControl
    case keyboard
    case pointerControl
    case switchControl
    case liveSpeech
    @available(macOS 14.0, macCatalyst 17.0, *)
    case personalVoice
    @available(macOS 15.0, macCatalyst 18.0, *)
    case vocalShortcuts
    case siri
    case shortcut
}

@available(macOS 13.0, macCatalyst 16.0, *)
public enum PrivacySecuritySettingsTab {
    case primary
    case locationServices
    case contacts
    case calendars
    case reminders
    case photos
    case bluetooth
    case microphone
    case camera
    @available(macOS 14.0, macCatalyst 17.0, *)
    case motion
    case homekit
    case speechRecognition
    case media
    case filesFolders
    case fullDiskAccess
    case focus
    case accessibility
    case inputMonitoring
//    @available(macOS 15.0, macCatalyst 18.0, *)
//    case localNetwork
    case screenRecording
    case passkeysAccess
    case automation
    case appManagement
    case developerTools
    @available(macOS 14.0, macCatalyst 17.0, *)
    case sensitiveContentWarning
    case analytics
    case advertising
    case fileVault
    @available(macOS 14.0, macCatalyst 17.0, *)
    case lockdownMode
    case extensions(ExtensionSettingsTab)
    case profiles
    case advanced
}

public enum ExtensionSettingsTab {
    case primary
    case action
    case fileProviders
    case xcodeSourceEditor
    
    var extensionPointIdentifier: String {
        switch self {
        case .primary:
            ""
        case .action:
            "com.apple.ui-services"
        case .fileProviders:
            "com.apple.fileprovider-nonui"
        case .xcodeSourceEditor:
            "com.apple.dt.Xcode.extension.source-editor"
        }
    }
}
