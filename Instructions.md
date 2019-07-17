

Cocoa Pods page:
https://guides.cocoapods.org/using/using-cocoapods.html

This is a good basic demo on how to use CocoaPods:
https://medium.com/@soufianerafik/how-to-add-pods-to-an-xcode-project-2994aa2abbf1

**Note:**
Once you have edited your Podfile, make sure you quit XCode and other related applications
like the simulator before proceeding. After you have successfully installed the required
pods, open up the "ProjectName.xcworkspace" and **NOT** the ".xcodeworkspace".

If accidentally you didn't follow the process like this, and you run into errors like:
"Could not build Objective-C module 'Firebase'"
or something related to "Firebase.h" not found, do the following:
 + Quit XCode and any other related applications
 + Delete project's temp files located at **~/Library/Developer/Xcode/DerivedData**
 + Delete **ProjectName.xcworkspace**
 + Delete **Podfile.lock** file and **Pods** folder
 + Run **pod install**.
 + Open the newly created **ProjectName.xcworkspace** file and build.

Afterwards if you are trying to build and there are some build errors check your
**Project Schemes**
Go from the toolbar on top like this:
Product-> Scheme-> FirebaseCore
Select whichever other stuff you need.
