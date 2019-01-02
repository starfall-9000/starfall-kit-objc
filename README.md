### Starfall Kit

a project using to build core function and base object for objective-c

guide how to build new project

### Step by Step

###### init project

###### add pod to project

_remember to add Pods/ to .gitignore file_

###### remove story board and using nib file

- delete Main.storyboard

- remove Main story board row in Info.plist

- init window with rootViewController from nib file in AppDelegate.m

##### add ios app icon

##### remove ios launch screen story board and using asset file

- delete LaunchScreen.storyboard

- remove Launch screen story board in Info.plist

- link new assets in Target > App Icons and Launch Images > Launch Images Source

##### add nav ctrl in AppDelegate

##### add prefix header *.pch file

- create prefix header file

- in Target > Build Settings > add link to Prefix Header $(SRCROOT)/dir_to_file.pch

##### add tabbar ctrl in AppDelegate

- override (if needed) BOTBaseTabbarController class and its function

- in AppDelegate create UITabbarController from tabbarWithListKeyword and add it to root

