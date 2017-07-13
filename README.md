# twitterClient


simple twitter clinet app for displaying followes and tweets

Features:
- Login by your twitter account
- Display your followers in a list with their image, name, handle and bio
- Display each follower profile with his profile image, banner image, and latest tweets
- Open images in seperate viewcontroller

Libraries used:
- TwitterKit : for easy logging with your twitter handler via browser or twitter app if it's installed 
- STTwitter: for authenticating twitter api requests
- RealmSwift: for saving data offline, removes the complexity of coredata
- Kingfisher: for caching images offline easily
- NYTPhotoViewer: for opening images in seperate View similar to facebook with sharing capablilites 
- ARSLineProgress: replacemnt for the default activity indicator in ios with more beautiful animations

Installation Instructions:
- clone or download the project then run pod install in your machine to install dependinces

Known Issues:
- Installing Realm framework can take long time to download if it's not already in your device (about 250 MB)
- When logging out and logging back in, same account will be still saved in safari data (Workaround: clear safari data from Settings > Safari > Clear history and website data)
