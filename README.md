# Cocoa-Chat
An internet based messaging application is one of my favorite projects! This is a user friendly(UI/UX wise) and fully functional. I have made custom .xib files to modify native design components. I have successfully integrated third party libraries using cocoapods, specifically CLTypingLabel for animation and IQKeyboardManager for nicer user experience. I used Firebase/Firestore modules in order to authenticate user with email/password. App is capable of quering data in the cloud. 

# Goal 
Integrate third party libraries using Cocoapods, specifically for text animation and scrolling the keyboard up   
Store data in the cloud using Firebase
Query the Firebase database 
User authentication using Firebase
Make custom .xib files to modify native design components 

# Image of Demo 
![Test Image 3](/CocoaChatTest-1.png)

![Test Image 3](/CocoaChatTest-2.png)

![Test Image 3](/CocoaChatTest-3.png)


# Troubleshotting 
	 Problems with installation - did everything as directed in the documentation - should have also made sure it is the latest version. Platform iOS 9.0 -> 13.0 - fixed. 
	 Fail to update auto layout status  - had to update pod - since I had imported firiebase dependecies in order to solve the other issues where it did not recognize Auth keyword - clean project- build project again - worked.  

