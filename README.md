# Weather App

## Description
This is an in class project I did for my Mobile Apps course. 
This app requires you to create an account at *https://openweathermap.org*, please review their website for more information. 

## Instructions
Since **Cocoapods** is used in this project, do not open this project as you normally would for other projects. 
1. Open *Xcode*
2. Click *Open another project...* under the project list
3. In the project directory, double click InClass08.**xcworkspace**

## Library used
The only external library that I used is **AlamoFire**. You can check detailed information at *https://github.com/Alamofire/Alamofire*

### Installing AlamoFire
**Make sure you have Cocoapods installed on your computer, if not, see instruction below**
1. Go to your project directory in the terminal and do: 
```console
#This shouldn't take long. Several files will be created in your project folder. 
$ pod init
```
2. Open **Podfile** using vim or any text editor of your choice
3. Before "end" add
```podfile
#This is the newest version if Alamofire in the time of making this instruction
#check their website for updates. 
pod 'Alamofire', '~> 5.0.0-beta.3'
```
save and close Podfile
4. In the project root directory, use command
```console
#This can take a while to install
$ pod install
```
5. The Alamofire library should be successfully installed

After installing **AlamoFire**, open **Info.plist** in Xcode: 
1. Add **NSAppTransportSecurity** field at the bottom
2. In the field you just added, add another boolean field **NSAllowsArbitraryLoads** and the value to true
This allows your app to communicate with an external server.
**This step has already been done in this particular project, but worth knowing for future projects**


## Pod
You will need to have **Cocoapods** installed on you computer in order to use this project. 

**Instructions**
```console
#to install cocoapods
$ sudo gem install cocoapods
```

## Custom Cities
The list of city data is stored in **AppData.swift** in **dictionary** format, you can add countries and cities of your choice in the **AppData** class, or to edit the code for other options such as user inputs.  
