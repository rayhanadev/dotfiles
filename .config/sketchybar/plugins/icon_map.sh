case $@ in
"FaceTime")
  icon_result=":face_time:"
  ;;
"Messages")
  icon_result=":messages:"
  ;;
"Twitter")
  icon_result=":twitter:"
  ;;
"VLC")
  icon_result=":vlc:"
  ;;
"Notes")
  icon_result=":notes:"
  ;;
"GitHub Desktop")
  icon_result=":git_hub:"
  ;;
"App Store")
  icon_result=":app_store:"
  ;;
"Chromium" | "Google Chrome" | "Google Chrome Canary")
  icon_result=":google_chrome:"
  ;;
"zoom.us")
  icon_result=":zoom:"
  ;;
"Color Picker")
  icon_result=":color_picker:"
  ;;
"Microsoft Word")
  icon_result=":microsoft_word:"
  ;;
"Microsoft Teams")
  icon_result=":microsoft_teams:"
  ;;
"WebStorm")
  icon_result=":web_storm:"
  ;;
"NVIM" | "Vim" | "VimR")
  icon_result=":vim:"
  ;;
"Notability")
  icon_result=":notability:"
  ;;
"WhatsApp")
  icon_result=":whats_app:"
  ;;
"OBS")
  icon_result=":obsstudio:"
  ;;
"Parallels Desktop")
  icon_result=":parallels:"
  ;;
"Microsoft Excel")
  icon_result=":microsoft_excel:"
  ;;
"Microsoft PowerPoint")
  icon_result=":microsoft_power_point:"
  ;;
"Matlab")
  icon_result=":matlab:"
  ;;
"Numbers")
  icon_result=":numbers:"
  ;;
"Default")
  icon_result=":default:"
  ;;
"Firefox")
  icon_result=":firefox:"
  ;;
"Firefox Developer Edition" | "Firefox Nightly")
  icon_result=":firefox_developer_edition:"
  ;;
"Trello")
  icon_result=":trello:"
  ;;
"Notion")
  icon_result=":notion:"
  ;;
"Live")
  icon_result=":ableton:"
  ;;
"Evernote Legacy")
  icon_result=":evernote_legacy:"
  ;;
"Calendar" | "Fantastical")
  icon_result=":calendar:"
  ;;
"Android Studio")
  icon_result=":android_studio:"
  ;;
"Xcode")
  icon_result=":xcode:"
  ;;
"Slack")
  icon_result=":slack:"
  ;;
"System Preferences" | "System Settings")
  icon_result=":gear:"
  ;;
"Discord" | "Discord Canary" | "Discord PTB")
  icon_result=":discord:"
  ;;
"Skype")
  icon_result=":skype:"
  ;;
"Dropbox")
  icon_result=":dropbox:"
  ;;
"微信")
  icon_result=":wechat:"
  ;;
"Blender")
  icon_result=":blender:"
  ;;
"Canary Mail" | "HEY" | "Mail" | "Mailspring" | "MailMate" | "邮件" | "Outlook")
  icon_result=":mail:"
  ;;
"Safari" | "Safari Technology Preview")
  icon_result=":safari:"
  ;;
"Telegram")
  icon_result=":telegram:"
  ;;
"Keynote")
  icon_result=":keynote:"
  ;;
"Spotify")
  icon_result=":spotify:"
  ;;
"Figma")
  icon_result=":figma:"
  ;;
"Joplin")
  icon_result=":joplin:"
  ;;
"Spotlight")
  icon_result=":spotlight:"
  ;;
"Music")
  icon_result=":music:"
  ;;
"Insomnia")
  icon_result=":insomnia:"
  ;;
"TIDAL")
  icon_result=":tidal:"
  ;;
"Alfred")
  icon_result=":alfred:"
  ;;
"Pages")
  icon_result=":pages:"
  ;;
"IntelliJ IDEA")
  icon_result=":idea:"
  ;;
"Drafts")
  icon_result=":drafts:"
  ;;
"Audacity")
  icon_result=":audacity:"
  ;;
"Atom")
  icon_result=":atom:"
  ;;
"Obsidian")
  icon_result=":obsidian:"
  ;;
"CleanMyMac X")
  icon_result=":desktop:"
  ;;
"Grammarly Editor")
  icon_result=":grammarly:"
  ;;
"Reminders")
  icon_result=":reminders:"
  ;;
"Preview" | "Skim" | "zathura")
  icon_result=":pdf:"
  ;;
"1Password 7")
  icon_result=":one_password:"
  ;;
"Code" | "Code - Insiders")
  icon_result=":code:"
  ;;
"Finder" | "访达")
  icon_result=":finder:"
  ;;
"Linear")
  icon_result=":linear:"
  ;;
"League of Legends")
  icon_result=":league_of_legends:"
  ;;
"Zeplin")
  icon_result=":zeplin:"
  ;;
"Signal")
  icon_result=":signal:"
  ;;
"Podcasts")
  icon_result=":podcasts:"
  ;;
"Alacritty" | "Hyper" | "iTerm2" | "kitty" | "Terminal" | "WezTerm")
  icon_result=":terminal:"
  ;;
"Tor Browser")
  icon_result=":tor_browser:"
  ;;
"Kakoune")
  icon_result=":kakoune:"
  ;;
"GrandTotal" | "Receipts")
  icon_result=":dollar:"
  ;;
"Sketch")
  icon_result=":sketch:"
  ;;
"Sequel Ace")
  icon_result=":sequel_ace:"
  ;;
"Replit")
  icon_result=":replit:"
  ;;
*)
  icon_result=":default:"
  ;;
esac
echo $icon_result
