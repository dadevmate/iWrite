//
//  ContentView.swift
//  iWrite
//
//  Created by Nethan on 23/5/22.
//

import SwiftUI
import Foundation
import LocalAuthentication
import UserNotifications




struct HomeView: View {
    @State var clickies = 0
    @State var tooLong = false
   @State var countsa = 0
 @State var imageLinkie = ""
    @State var greetingsText = ""
    @AppStorage("latestEntry") var latestEntry = ""
    @State var daties = Date.now
  @State private var titles : [String] =  UserDefaults.standard.object(forKey: "titles") as? [String] ?? []
    @FocusState private var keyTurnOn: Bool
   @State private var remindersSheet = false
    @State var scheduled2 = false
    @State var emptyBlanks = false
    @State var deleteAccount = false
@AppStorage("req") var requestSuccess = false
    @State private var animateGradient = false
    @State private var showImagePicker = false
    @State private var isUnlocked = false
    @State var hoursies = 0
@State var customiee = ""
    @State var minutesie = 1
 @State private var texties: [String] = UserDefaults.standard.object(forKey: "texties") as? [String] ?? []
    @AppStorage("notifTitleConf") var notifTitleConf = ""
    @AppStorage("notifMessageConf") var notifMessageConf = ""
    @State var notifTitle = ""
    @State var notifMessage = ""
    @State var scheduled = false
    @AppStorage("hoursiee") var hoursi = 1

    @State var shopShown = false
 @State var purchaseSuccess = false
    @State var purchaseFail = false
    @State var processing = false
  @State private var dates: [Date] = UserDefaults.standard.object(forKey: "dates") as? [Date] ?? []
@State var krotosSheet = false
    @State var spamAlert = false
    @State private var imagas: [String] = UserDefaults.standard.object(forKey: "imagas") as? [String] ?? []
    @AppStorage("sheetShow") var showingSheet = true
@State var textValue = ""
    @State var addEntry = false
@State private var presentSheet = false

@State var searchedText = ""
    @State private var entrySelected: [Int] = UserDefaults.standard.object(forKey: "entrySelected") as? [Int] ?? []
    @AppStorage("entry") private var entry = 0
    @State private var imageURLs: [String] = UserDefaults.standard.object(forKey: "imageURLs") as? [String] ?? []
    @State private var title = ""
    @State private var text = ""
    @State private var date = ""
    @State var postsPresent = false
    @State var presentAlert = false
    @State var saveData = false
    @AppStorage("level") var level = 0
    @State var aboutSheet = false
    @State var help = false
    @State var profile = false
    @State var missingInfo = false
    @State var selectedDate = Date.now
    @FocusState private var keyboardOn: Bool
   @AppStorage("customGreet") var customGreet = false
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    @State var bagShown = false
     @State var thatImage = ""
    @State var thatDate = Date.now
    @State var thatText = ""
    @State var thatTitle = ""
@AppStorage("krotos") var krotos = 5
@AppStorage("characters") var characters = 150
@AppStorage("increaseKrotos") var increaseKrotos = 1
@State var avatarEquipped = false

@State var imagesOwned = UserDefaults.standard.object(forKey: "imagesOwned") as? [String] ?? []
  @State var fiill = false
@AppStorage("imageSelected") var imageSelected = "person.crop.circle.badge.questionmark.fill"
    @AppStorage("greetingsie") var greetingsie = ""

@AppStorage("shopClicked") var shopClicked = false
    
    var body: some View {
 
        
        VStack {
    
            if isUnlocked == false {
                VStack {
        
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("  Authenticate. \n       Securely. ")
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                    Image(systemName: "faceid")
                            .foregroundColor(.blue)
                            .font(.system(size: 80))
                         
                        Spacer()
                        Image(systemName: "touchid")
                            .foregroundColor(.red)
                            .font(.system(size: 80))
                        
                  
                        Spacer()
                    }
                    Spacer()
                    
                    Text(" Sorry mate, but we need either your \n Touch ID or Face ID to unlock this app. \n We really don't want people to be snooping \n around our user's journal entries without \n their consent. Try to quit this app and try \n to sign in again.")
                        .fontWeight(.ultraLight)
                    
                    Spacer()
                   Spacer()
                }
            } else {
            
          
     
        NavigationView {
            
           
        ZStack {
            LinearGradient(colors: [Color(red: 0.3, green: 0.2, blue: 0.8), .black], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
                }
            
        VStack {
            
            Spacer()
            Spacer()
            Spacer()
     
            VStack {
                
         
            Spacer()
            
                Spacer()
                
                
    
                    
                VStack {
              
                HStack {
         Spacer()
                    Spacer()
              
                    if customGreet == false {
                        Text("Hello there!")
                            .fontWeight(.bold)
                            .font(.title2)
                            .foregroundColor(Color(red: 0.3, green: 0.4, blue: 0.8))
                    } else {
                        Text("\(greetingsie)")
                            .fontWeight(.bold)
                            .font(.title2)
                            .foregroundColor(Color(red: 0.3, green: 0.4, blue: 0.8))
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
        
                
                }
                    
           
                 
                            
                                
               
                        BannerAd(unitId: "ca-app-pub-6142532326654511/8733697450")
                 
                            
                        
                        
                    }
                
              
            }

        

            
      
            
            VStack {
                
                Spacer()
                Spacer()
                Spacer()
     
                VStack {
                    Button {
                   
                      bagShown = true
                        
                    } label: {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [.purple, .cyan], startPoint: .bottomLeading, endPoint: .topLeading))
                                .frame(width: 200, height: 50)
                            
                            Image(systemName: "bag.fill")
                                .font(.system(size: 30))
                                .cornerRadius(5)
                                .foregroundColor(.white)
                        }
                    }.sheet(isPresented: $bagShown) {
                        
                        VStack {
                        Spacer()
                        Spacer()
                
                            VStack {
                        Text("Bag")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                              Text("Items you buy in the shop will appear here.")
                                  .font(.caption)
                                  .fontWeight(.light)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                       
                            
                            List {
                                ForEach(imagesOwned, id: \.self) { imageName in
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        imageSelected = imageName
                                        avatarEquipped = true
                                    }) {
                                        Image(systemName: "\(imageName)")
                                                .font(.largeTitle)
                                                .foregroundColor(.primary)
                                    }
                                    .alert("Avatar equipped successfully", isPresented: $avatarEquipped) {
                                        
                                    } message: {
                                        Text("Your new Avatar is now on your profile page!")
                                    }
                            
                                    Spacer()
                                }
                               
                                
                                  
                                    
                                    
                                }
                                
                          
                           }
                            }
                        }
                    }
                    
                    
               
            
               
                    
                    HStack {
                    
                Button {
                    postsPresent = true
                } label : {
                    
                
                        Image(systemName: "newspaper.circle.fill")
                        .font(.system(size: 70))
                             .foregroundColor(.white)
                             
                    
                    
                    
                }
               
                
                
               
                .sheet(isPresented: $postsPresent) {
                    NavigationView {
                    List {
                        Section {
                            VStack {
                                
                            }
                            .sheet(isPresented: $remindersSheet) {
                                NavigationView {
                                List {
                                    
                                
                                    if requestSuccess == false {
                                    Button("Enable notifications") {
                                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                            
                                            if success {
                                                print("All set")
                                        requestSuccess = true
                                            } else if let error = error {
                                                print(error.localizedDescription)
                                            }
                                        }
                                        }
                                    
                                    } else if requestSuccess == true {
                                        
                                        Section {
                                        
                                            Stepper("No. of hours",value: $hoursi, in: 1...9)
                                        Text("\(hoursi) hour(s)")
                                    Button("Schedule journalling reminder") {
                                        let content = UNMutableNotificationContent()
                                        content.title = "Journalling time!"
                                        content.subtitle = "Time to add an entry to your journal"
                                        content.sound = UNNotificationSound.default
                                        
                                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(hoursi * 3600), repeats: true)
                                        
                                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                        
                                        UNUserNotificationCenter.current().add(request)
                                        
                                        scheduled = true
                                    }
                                    .alert("Journalling reminder successfully scheduled!",isPresented: $scheduled) {
                                        
                                    } message: {
                                        Text("Every \(hoursi) hour(s), you'll receive a reminder to add a new entry to your journal!")
                                    }
                                        } header: {
                                            Text("Daily journalling reminder")
                                        }
                                        
                                        
                                        
                                        Section {
                                            Stepper("No. of hours",value: $hoursies, in: 0...9)
                                        Text("\(hoursies) hour(s)")
                                            Stepper("No. of minutes",value: $minutesie, in: 1...60)
                                        Text("\(minutesie) minute(s)")
                                            TextField("Title", text: $notifTitle)
                                            
                                            TextField("Message", text: $notifMessage)
                                    
                                    Button("Schedule custom reminder") {
                                      
                                        
                                        if notifTitle.trimmingCharacters(in: .whitespacesAndNewlines) != ""  && notifMessage.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                                        notifTitleConf = notifTitle
                                        notifMessageConf = notifMessage
                                        
                                        notifTitle = ""
                                        notifMessage = ""
                                        
                            
                                        
                                        
                                        
                                        let content = UNMutableNotificationContent()
                                        content.title = "\(notifTitleConf)"
                                        content.subtitle = "\(notifMessageConf)"
                                        content.sound = UNNotificationSound.default
                                        
                                        
                                        
                                        
                                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(hoursies * 3600 + minutesie * 60), repeats: false)
                                        
                                        
                                        
                                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                        
                                        UNUserNotificationCenter.current().add(request)
                                        scheduled2 = true
                                        } else {
                                            emptyBlanks = true
                                        }
                                    }
                                    .alert("Missing fields", isPresented: $emptyBlanks) {
                                        
                                    } message: {
                                        Text("Please fill up any blank fields.")
                                    }
                                    .alert("Reminder set successfully!",isPresented: $scheduled2) {
                                        
                                    } message: {
                                        Text("In \(hoursies) hour(s) and \(minutesie) minute(s), you'll receive your custom reminder.")
                                    }
                                        } header: {
                                            Text("Custom reminder")
                                        }
                                    }
                                    
                                }
                                .navigationTitle("Schedule reminders")
                                }
                            }
                            
                            Text("When you first enter the app ( after quitting it ), you must double tap the entry you choose. If not, all your entries will be messed up.")
                                .fontWeight(.bold)

                            ForEach(entrySelected, id: \.self) { hi in
                                Section {
                                    
                                    Button(action:{
                                        
                                        clickies += 1
                                        thatImage = imagas[hi]
                                        thatDate = dates[hi]
                                        thatText = texties[hi]
                                        thatTitle = titles[hi]
                                        
                                        if clickies == 1 {
                                          processing = true
                                        } else {
                                            presentSheet = true
                                        }
                                        
                                    }) {
                                        HStack {
                                        Image(systemName: "\(hi).circle.fill")
                                                .foregroundColor(Color.primary)
                                        Text("\(titles[hi])")
                                                .foregroundColor(Color.primary)
                                    
                                        
                                        }
                                    }
                                    .alert("This entry is still processing", isPresented: $processing) {
                                        
                                    } message: {
                                        Text("Please click ONLY this entry again.")
                                    }
                                    .sheet(isPresented: $presentSheet) {
                                        NavigationView {
                                        List {
                                            
                                        
                                            
                                             
                                  
                    
                                    
                                            HStack {
                                                Spacer()
                                   Text("\(thatTitle)")
                                        .fontWeight(.bold)
                                        .font(.title)
                                                Spacer()
                                            }
                   Spacer()
                                    
                                    
                                    HStack {
                                        Spacer()
                                    Text("\(thatDate)")
                                            .fontWeight(.light)
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                    }
                                           
                                    Spacer()
                                            
                                      
                                                AsyncImage(url: URL(string: "\(thatImage)")) { image in image
                                                        .resizable()
                                                        .scaledToFit()
                                                } placeholder: {
                                                    
                                                    ProgressView()
                                                        .progressViewStyle(.circular)
                                                }
                                              
                                            
                                            Spacer()
                                    Text("\(thatText)")
                                        .font(.body)
                                    
                                    Spacer()
                                    Spacer()
                                 
                                         
                               
                                        }
                                   
                               
                                        }
                                        Spacer()
                                }
                                  
                                    
                             
                                }
                            
                           }
                       
                        }
                       }
                   
                    .navigationTitle("My Entries")
                    .toolbar {
                        ToolbarItem(placement: .keyboard) {
                            Button("Done") {
                                keyTurnOn = false
                            }
                        }
                     
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    
                          
                                        remindersSheet = true
                                    
                                } label: {
                                    Image(systemName: "calendar.badge.clock")
                                }
                            }
                        
                    }
                    }
               
                }
                  
            Button {
                aboutSheet = true
            } label : {
                
       
         
                    Image(systemName: "info.circle.fill")
                        .font(.system(size: 70))
                        .foregroundColor(.white)
           
             
            
                
            } .sheet(isPresented: $aboutSheet) {
                Spacer()
                Text("About this app")
                    .font(.title)
                    .fontWeight(.light)
                
                Spacer()
                
                Image(systemName: "square.and.pencil")
                    .font(.largeTitle)
                    .padding(.top, -50)
                
          
         
                Text("YouWrite was made to allow people to make \n journal entries with ease. As many people \n in today's world want to keep a journal but \n don't have time to update it, YouWrite allows \n you to update your journal on the \n go. With the date & time automatically set, \n you can focus on making great entries you \n can look back on! All entries are saved \n locally on your iPhone.")
                    .fontWeight(.ultraLight)
                
     Spacer()
                
                HStack {
                    Spacer()
                    Image(systemName: "faceid")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    Spacer()
                    Image(systemName: "touchid")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    Spacer()
                }
                
                Spacer()
               
        
                Text("Protect your entries and prevent \n others from accessing them with \n Touch ID or Face ID")
                    .fontWeight(.ultraLight)
                   
      
                Spacer()
                
    
     
           
        
               
            }
                    }
                    HStack {
    
                    
            Button {
                help = true
            } label : {
    
    
                   Image(systemName: "questionmark.circle.fill")
                    .font(.system(size: 70))
                        .foregroundColor(.white)
           
                  
         
            } .sheet(isPresented: $help) {
                
                VStack {
       Spacer()
                    
                    HStack {
                        
                        Image(systemName: "questionmark.circle.fill")
                            .font(.largeTitle)
                Text("Need help? We're on it!")
                    .font(.title)
                    .fontWeight(.light)
                
    
                
           
                    }
                
              Spacer()
         
                Text("Do my entries save after leaving the app?")
                    .font(.headline)
                    .fontWeight(.medium)
                
     
                
                Text(" Yup, they do. However, please note that \n  when you delete the app, \n  your journal entries will be lost as \n they are saved locally on your iPhone \n and not in iCloud. ")
                    .fontWeight(.ultraLight)
                
                Spacer()
                    Spacer()
                Text("What is Krotos? How do I earn it?")
                    .font(.headline)
                    .fontWeight(.medium)
                
                
                Text("            Krotos is the virtual currency in \n            our app. Get more of it by writing \n more entries. The more you write, the more \n            Krotos you get each time. However, \n                  there is a certain number of \n             characters you must write to get \n                                     Krotos. \n \n The character requirement increases as \n you write more entries. The starting character \n limit is 150. However, you do get more \n Krotos each time you write a new entry if the \n character limit is met. \n \n Krotos can be used to purchase \n profile images and other special perks,\n which are coming soon! Stay tuned!")
                    .fontWeight(.ultraLight)
                   
                    Spacer()
                    
                }
     
           
            }
      
    
                
                Button {
                    profile = true
                } label : {
           
                   
                        Image(systemName: "person.circle.fill")
                        .font(.system(size: 70))
                            .foregroundColor(.white)
                
                } .sheet(isPresented: $profile) {
                    VStack {
                        VStack {
            
                            Spacer()
                            Spacer()
                    Text("Your Profile")
                            .fontWeight(.ultraLight)
                            .font(.title)
                            .padding(.top, -70)
                       
                        
                        if imagesOwned.count > 0 {
                        Image(systemName: "\(imageSelected)")
                            .font(.system(size: 80))
                        } else {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 80))
                        }
                            Text("Personalise your profile with \n an avatar from the store, \n bought using Krotos.")
                                .fontWeight(.light)
                                .font(.caption)
                            Spacer()
                        }
                        VStack {
      
                          
                      
                         Spacer()
                            
                        
                            
                        Text("Krotos: \(krotos)")
                                 .fontWeight(.light)
                                 .font(.title)
                                 .padding(.top, 10)
                            Spacer()
                        Text("Level: \(level)")
                                 .fontWeight(.light)
                                 .font(.title)
                                 .padding(.top, 10)
                            
                            
                            Spacer()
                            
                         

                   
                            VStack {
              
           
                                
                       Text("Your Krotos and Level will be reset when you delete this app.")
                           .fontWeight(.ultraLight)
                            .font(.caption2)
                            .padding()
                            }
                        }
                    }
         
                }
                        
                        
                }
                    Button {
                addEntry = true
                    } label: {
                    
                            VStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 70))
                            }
                    .foregroundColor(Color(red: 0.5, green: 0.4, blue: 0.8))
                        }
                    Button {
                       shopShown = true
                       shopClicked = true
                    } label: {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [.blue, .cyan], startPoint: .bottomLeading, endPoint: .topLeading))
                                .frame(width: 200, height: 50)
                            
                            Image(systemName: "cart.fill")
                                .font(.system(size: 30))
                                .cornerRadius(5)
                                .foregroundColor(.white)
                        }
                    }.sheet(isPresented: $shopShown) {
                        
                        ZStack {
                    
                            VStack {
                        Spacer()
                        Text("Shop")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("   Shop with your Krotos.")
                            .fontWeight(.light)
                            .font(.body)
                                
                                
                                List {
                                    
                                    
                             
                                    
                                    Section {
                                   
                                        VStack {
                                            HStack {
                                                
                                                Text("Balance: \(krotos) Krotos")
                                                    .fontWeight(.heavy)
                                                    .font(.body)
                                                Spacer()
                                            }
                                            HStack {
                                                
                                                Text("Avatars for your profile")
                                                    .fontWeight(.light)
                                                    .font(.body)
                                                Spacer()
                                            }
                                        }
                                        VStack {
                                            
                                            Button(action: {
                                                if imagesOwned.contains("banknote") != true {
                                                    if krotos >= 10 {
                                                        krotos-=10
                                                        purchaseSuccess = true
                                                        imagesOwned.append("banknote")
                                                        UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                      
                                                    } else {
                                                       purchaseFail = true
                                                    }
                                            }) {
                                                Image(systemName: "banknote")
                                                            .font(.largeTitle)
                                                    .frame(width: 310, height: 50)
                                                    .foregroundColor(.primary)
                                                  
                                                Text("10 Krotos")
                                                    .fontWeight(.ultraLight)
                                                    .foregroundColor(.primary)
                                            }
                             
                                        }
                                    }
                                    
                                    Section {
                                   
                                        VStack {
                                            Button(action: {
                                                if imagesOwned.contains("gamecontroller.fill") != true {
                                                    if krotos >= 250 {
                                                        krotos-=250
                                                        purchaseSuccess = true
                                                        imagesOwned.append("gamecontroller.fill")
                                                        UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                      
                                                    } else {
                                                       purchaseFail = true
                                                    }
                                            }) {
                                                Image(systemName: "gamecontroller.fill")
                                                            .font(.largeTitle)
                                                    .frame(width: 310, height: 50)
                                                    .foregroundColor(.primary)
                                                  
                                                Text("250 Krotos")
                                                    .fontWeight(.ultraLight)
                                                    .foregroundColor(.primary)
                                            }
                                        }
                                        
                                  
                                    }
                                    
                                   
                                    
                                    Section {
                                 
                                        VStack {
                                 
                                            
                                            
                                            Button(action: {
                                                if imagesOwned.contains("airplane") != true {
                                                    if krotos >= 80 {
                                                        krotos-=80
                                                        purchaseSuccess = true
                                                        imagesOwned.append("airplane")
                                                        UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                      
                                                    } else {
                                                       purchaseFail = true
                                                    }
                                            }) {
                                                Image(systemName: "airplane")
                                                            .font(.largeTitle)
                                                    .frame(width: 310, height: 50)
                                                    .foregroundColor(.primary)
                                                  
                                                Text("80 Krotos")
                                                    .fontWeight(.ultraLight)
                                                    .foregroundColor(.primary)
                                            }
                                        }
                                    }
                                        
                        
                                    
                       
                                    Section {
                                   
                                        VStack {
                                  
                                            
                                            
                                            Button(action: {
                                                if imagesOwned.contains("car") != true {
                                                    if krotos >= 150 {
                                                        krotos-=150
                                                        purchaseSuccess = true
                                                        imagesOwned.append("car")
                                                        UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                      
                                                    } else {
                                                       purchaseFail = true
                                                    }
                                            }) {
                                                Image(systemName: "car")
                                                            .font(.largeTitle)
                                                    .frame(width: 310, height: 50)
                                                    .foregroundColor(.primary)
                                                  
                                                Text("150 Krotos")
                                                    .fontWeight(.ultraLight)
                                                    .foregroundColor(.primary)
                                            }
                                        }
                                    }
                                    
                                 
                                    
                                    Section {
                              
                                        VStack {
                                  
                                            
                                            Button(action: {
                                                if imagesOwned.contains("car.2.fill") != true {
                                                    if krotos >= 135 {
                                                        krotos-=135
                                                        purchaseSuccess = true
                                                        imagesOwned.append("car.2.fill")
                                                        UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                      
                                                    } else {
                                                       purchaseFail = true
                                                    }
                                            }) {
                                                Image(systemName: "car.2.fill")
                                                            .font(.largeTitle)
                                                    .frame(width: 310, height: 50)
                                                    .foregroundColor(.primary)
                                                  
                                                Text("135 Krotos")
                                                    .fontWeight(.ultraLight)
                                                    .foregroundColor(.primary)
                                            }
                                        }
                                        }
                                    
                              
                                    Section {
                               
                                        VStack {
                               
                                            
                                            Button(action: {
                                                if imagesOwned.contains("earbuds") != true {
                                                    if krotos >= 500 {
                                                        krotos-=500
                                                        purchaseSuccess = true
                                                        imagesOwned.append("earbuds")
                                                        UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                      
                                                    } else {
                                                       purchaseFail = true
                                                    }
                                            }) {
                                                Image(systemName: "earbuds")
                                                            .font(.largeTitle)
                                                            .frame(width: 310, height: 50)
                                                            .foregroundColor(.primary)
                                                  
                                                Text("500 Krotos")
                                                    .fontWeight(.ultraLight)
                                                    .foregroundColor(.primary)
                                                        
                                                        
                                            }
                                        }
                                    }
                                    
                                    
                                    
                                    Section {
                                      
                                        VStack {
                               
                                            
                                            Button(action: {
                                                if imagesOwned.contains("brain.head.profile") != true {
                                                    if krotos >= 50 {
                                                        krotos-=50
                                                        purchaseSuccess = true
                                                        imagesOwned.append("brain.head.profile")
                                                        UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                      
                                                    } else {
                                                       purchaseFail = true
                                                    }
                                            }) {
                                                Image(systemName: "brain.head.profile")
                                                            .font(.largeTitle)
                                                    .frame(width: 310, height: 50)
                                                    .foregroundColor(.primary)
                                                  
                                                Text("50 Krotos")
                                                    .fontWeight(.ultraLight)
                                                    .foregroundColor(.primary)
                                            }
                                            
                                        }
                                    }
                                    Section {
                               
                                        VStack {
                                   
                                            
                                            Button(action: {
                                                
                                                if imagesOwned.contains("flame.fill") != true {
                                                    if krotos >= 170 {
                                                        krotos-=170
                                                        purchaseSuccess = true
                                                        imagesOwned.append("flame.fill")
                                                        UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                      
                                                    } else {
                                                       purchaseFail = true
                                                    }
                                            }) {
                                                Image(systemName: "flame.fill")
                                                            .font(.largeTitle)
                                                    .frame(width: 310, height: 50)
                                                    .foregroundColor(.primary)
                                                  
                                                Text("170 Krotos")
                                                    .fontWeight(.ultraLight)
                                                    .foregroundColor(.primary)
                                            }
                                        }
                                    }
                                
                                    Section {
                                   
                                        VStack {
                        
                                            
                                            Button(action: {
                                                
                                                if imagesOwned.contains("pc") != true {
                                                    if krotos >= 90 {
                                                        krotos-=90
                                                        purchaseSuccess = true
                                                        imagesOwned.append("pc")
                                                        UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                      
                                                    } else {
                                                       purchaseFail = true
                                                    }
                                            }) {
                                                Image(systemName: "pc")
                                                            .font(.largeTitle)
                                                    .frame(width: 310, height: 50)
                                                    .foregroundColor(.primary)
                                                  
                                                Text("90 Krotos")
                                                    .fontWeight(.ultraLight)
                                                    .foregroundColor(.primary)
                                            }
                                          
                                        }
                                    }
                                 
                                    
                                    Section {
                                        
                                        Section {
                                            VStack {
                                                
                                                
                                                Button(action: {
                                                    
                                                    if imagesOwned.contains("hare.fill") != true {
                                                        if krotos >= 125 {
                                                            krotos-=125
                                                            purchaseSuccess = true
                                                            imagesOwned.append("hare.fill")
                                                            UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                        } else {
                                                            purchaseFail = true
                                                        }
                                                        
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                }) {
                                                    Image(systemName: "hare.fill")
                                                        .font(.largeTitle)
                                                        .frame(width: 310, height: 50)
                                                        .foregroundColor(.primary)
                                                    
                                                    Text("125 Krotos")
                                                        .fontWeight(.ultraLight)
                                                        .foregroundColor(.primary)
                                                }
                                            }
                                        }
                                        
                                        Section {
                                            
                                            VStack {
                                                
                                                
                                                Button(action: {
                                                    
                                                    if imagesOwned.contains("function") != true {
                                                        if krotos >= 500 {
                                                            krotos-=500
                                                            purchaseSuccess = true
                                                            imagesOwned.append("function")
                                                            UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                        } else {
                                                            purchaseFail = true
                                                        }
                                                        
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                }) {
                                                    Image(systemName: "function")
                                                        .font(.largeTitle)
                                                        .frame(width: 310, height: 50)
                                                        .foregroundColor(.primary)
                                                    
                                                    Text("500 Krotos")
                                                        .fontWeight(.ultraLight)
                                                        .foregroundColor(.primary)
                                                }
                                            }
                                        }
                                        
                                        Section {
                                            
                                            VStack {
                                                
                                                
                                                Button(action: {
                                                    
                                                    if imagesOwned.contains("signature") != true {
                                                        if krotos >= 1000 {
                                                            krotos-=1000
                                                            purchaseSuccess = true
                                                            imagesOwned.append("signature")
                                                            UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                        } else {
                                                            purchaseFail = true
                                                        }
                                                        
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                }) {
                                                    Image(systemName: "signature")
                                                        .font(.largeTitle)
                                                        .frame(width: 310, height: 50)
                                                        .foregroundColor(.primary)
                                                    
                                                    Text("1000 Krotos")
                                                        .fontWeight(.ultraLight)
                                                        .foregroundColor(.primary)
                                                }
                                            }
                                        }
                                        
                                        
                                        Section {
                                            
                                            VStack {
                                                
                                                
                                                Button(action: {
                                                    
                                                    if imagesOwned.contains("heart.text.square.fill") != true {
                                                        if krotos >= 2000 {
                                                            krotos-=2000
                                                            purchaseSuccess = true
                                                            imagesOwned.append("heart.text.square.fill")
                                                            UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                        } else {
                                                            purchaseFail = true
                                                        }
                                                        
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                }) {
                                                    Image(systemName: "heart.text.square.fill")
                                                        .font(.largeTitle)
                                                        .frame(width: 310, height: 50)
                                                        .foregroundColor(.primary)
                                                    
                                                    Text("2000 Krotos")
                                                        .fontWeight(.ultraLight)
                                                        .foregroundColor(.primary)
                                                }
                                            }
                                        }
                                        
                                        Section {
                                            
                                            VStack {
                                                
                                                
                                                Button(action: {
                                                    
                                                    if imagesOwned.contains("globe.asia.australia") != true {
                                                        if krotos >= 2500 {
                                                            krotos-=2500
                                                            purchaseSuccess = true
                                                            imagesOwned.append("globe.asia.australia")
                                                            UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                        } else {
                                                            purchaseFail = true
                                                        }
                                                        
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                }) {
                                                    Image(systemName: "globe.asia.australia")
                                                        .font(.largeTitle)
                                                        .frame(width: 310, height: 50)
                                                        .foregroundColor(.primary)
                                                    
                                                    Text("2500 Krotos")
                                                        .fontWeight(.ultraLight)
                                                        .foregroundColor(.primary)
                                                }
                                            }
                                        }
                                        
                                        Section {
                                            
                                            VStack {
                                                
                                                
                                                Button(action: {
                                                    
                                                    if imagesOwned.contains("tortoise.fill") != true {
                                                        if krotos >= 3000 {
                                                            krotos-=3000
                                                            purchaseSuccess = true
                                                            imagesOwned.append("tortoise.fill")
                                                            UserDefaults.standard.set(imagesOwned, forKey: "imagesOwned")
                                                        } else {
                                                            purchaseFail = true
                                                        }
                                                        
                                                    } else {
                                                        purchaseFail = true
                                                    }
                                                }) {
                                                    Image(systemName: "tortoise.fill")
                                                        .font(.largeTitle)
                                                        .frame(width: 310, height: 50)
                                                        .foregroundColor(.primary)
                                                    
                                                    Text("3000 Krotos")
                                                        .fontWeight(.ultraLight)
                                                        .foregroundColor(.primary)
                                                }
                                            }
                                        }
                                        
                                        HStack {
                                            Spacer()
                                        Section {
                                            
                                            VStack {
                                                Text("Buy Custom greeting")
                                                    .fontWeight(.light)
                                                    .font(.body)
                                                Text("It'll appear when you open the app.")
                                                    .fontWeight(.light)
                                                    .font(.caption)
                                                Text("4000 Krotos")
                                                    .fontWeight(.ultraLight)
                                                    .font(.body)
                                                TextField("Your custom greeting", text: $customiee)
                                                    .frame(width: 300)
                                                    .cornerRadius(10)
                                                    .textFieldStyle(
                                                        RoundedBorderTextFieldStyle()
                                                    )
                                                    .focused($keyboardOn)
                                                
                                                Button {
                                                    
                                                    if customiee.count == 0 {
                                                        fiill = true
                                                    } else {
                                                        if customGreet == false {
                                                            if krotos >= 4000 {
                                                                
                                                                if customiee.count < 20 {
                                                                    krotos -= 4000
                                                                    customGreet = true
                                                                    greetingsie = customiee
                                                                    
                                                                    customiee = ""
                                                                    
                                                                    purchaseSuccess = true
                                                                } else {
                                                                    tooLong = true
                                                                }
                                                            } else {
                                                                purchaseFail = true
                                                            }
                                                        } else {
                                                            purchaseFail = true
                                                        }
                                                    }
                                                    
                                                    
                                                    
                                                } label: {
                                                    
                                                    ZStack {
                                                        RoundedRectangle(cornerRadius: 8)
                                                            .frame(width: 200, height: 60)
                                                            .foregroundColor(.black)
                                                        Text("Purchase")
                                                            .font(.system(size: 22))
                                                            .foregroundColor(.white)
                                                    }
                                                }
                                                
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    }
                                    
                                    
                                    
                                   
                                
                              
                                }.alert("Purchase successful", isPresented: $purchaseSuccess) {
                                    
                                } message: {
                                    Text("Enjoy your purchase!")
                                }
                                .confirmationDialog("Purchase failed", isPresented: $purchaseFail, titleVisibility: .visible) {
                                   
                                } message: {
                                    Text("Something went wrong. Perhaps you already own this item or you don't have enough Krotos to buy it.")
                                }
                                .confirmationDialog("Fill in everything", isPresented: $fiill, titleVisibility: .visible) {
                                   
                                } message: {
                                    Text("Please fill in the custom greeting that you would like to purchase.")
                                }
                                .confirmationDialog("Custom greeting too long", isPresented: $tooLong, titleVisibility: .visible) {
                                   
                                } message: {
                                    Text("Your custom greeting must be less than 20 characters. Please fix it.")
                                }

                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                  
        
                            }
                        }
                      
                    }
                  
            Spacer()
                    Spacer()
                    HStack {
                        
                        Spacer()
                        
                  
                        
                        Spacer()

                    }
                    
                    
            }

                       
                  
        }
            
            VStack {
                
               
                
            }
            .sheet(isPresented: $showingSheet) {
                Spacer()
                Image(systemName: "pencil.and.outline")
                    .font(.system(size: 100))
                Spacer()
                Text("Welcome to YouWrite. This is an app that allows you  to make journal entries right on your iPhone.  Make as many as you want in our beautiful font. They won't be shared with anyone, and will always be kept safe, right on your phone.")
                    .font(.body)
                    .fontWeight(.thin)
                    .frame(width: 300)
                Spacer()
                Text("Note: All YouWrite entries will be stored locally on your iPhone. When you delete the app, your entries will be lost.")
                    .font(.body)
                    .fontWeight(.light)
                    .frame(width: 250)
                Spacer()
                Button {
                    showingSheet = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                        .frame(width: 200, height: 60)
                        .foregroundColor(.black)
                        Text("Start writing")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    }
                }
                .background(Color.black)
                .cornerRadius(8)
            Spacer()
            }
            
            VStack {
                
            }
            .sheet(isPresented: $krotosSheet) {
                kroc()
               }
            
            VStack {
                
            } .sheet(isPresented: $addEntry) {
                
                NavigationView {
                 
                    List {
                        
                        
                        
      
                
                VStack {
              
                 
                VStack {
                    
                    /*
                TextField("Date:", text: $date)
                   .frame(width: 150)
                        .cornerRadius(10)
                        .textFieldStyle(
                            RoundedBorderTextFieldStyle()
                        )
                        .focused($keyboardOn)
                    */
          
                    DatePicker(selection: $selectedDate) {
                        Text("Select a date:")
                    }
                   
               
                    TextField("Title:", text: $title)
                            .frame(width: 200)
                            .cornerRadius(10)
                            .textFieldStyle(
                                RoundedBorderTextFieldStyle()
                            )
                            .focused($keyboardOn)
                    
                    TextField("Image link (optional):", text: $imageLinkie)
                            .frame(width: 300)
                            .cornerRadius(10)
                            .textFieldStyle(
                                RoundedBorderTextFieldStyle()
                            )
                            .focused($keyboardOn)
      
                    AsyncImage(url: URL(string: "\(imageLinkie)")) { image in image
                             .resizable()
                            .scaledToFit()
                    } placeholder: {
                   
                         ProgressView()
                            .progressViewStyle(.circular)
                    }
          
                }
       Spacer()
                   
                TextEditor(text: $text)
                    .frame(width: 300.0, height: 200)
                    .border(Color.primary,width: 1)
                    .focused($keyboardOn)
                    
                   
                    
                    
                Button {
                    if text == "" && title == "" || text == "" || title == "" {
                        missingInfo = true
                    } else {
                        presentAlert = true
                    }
                } label: {
                   
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                        .frame(width: 200, height: 60)
                        .foregroundColor(.black)
                        Text("Add to entries")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    }
                    }
                    Spacer()
                        .confirmationDialog("You've already submitted a similar entry", isPresented: $spamAlert, titleVisibility: .visible) {
                            
                        } message: {
                            Text("Please write more unique entries, before submitting.")
                        }
                    .background(Color.black)
                    .cornerRadius(8)
                    .alert("Are you sure you want to create this journal entry?", isPresented: $presentAlert) {
              
              
                        
                        Button("Yes", role: .destructive) {
                            saveData = true
                               
                    
                            if saveData == true {
                                
                                if texties.contains(text.trimmingCharacters(in: .whitespacesAndNewlines)) != true {
                                    selectedDate = Date.now
                                if text.count > characters {
                                    krotos += increaseKrotos
                                    characters += 50
                                    increaseKrotos += 2
                                    level += 1
                                    krotosSheet = true
                                }
                                texties.append(text)
                                titles.append(title)
                                
                       dates.append(selectedDate)
                                    imagas.append(imageLinkie)
                                    latestEntry = title
                                    
                                entrySelected.append(entry)
                                    
                                    addEntry = false
                                entry += 1
                                
                                text = ""
                                date = ""
                                title = ""
                                imageLinkie = ""
                                saveData = false
                                    
                                    
                        
                                    
                                  
                               
                                UserDefaults.standard.set(titles, forKey: "titles")
                                
                                UserDefaults.standard.set(dates, forKey: "dates")
                                UserDefaults.standard.set(texties, forKey: "texties")
                                   
                                UserDefaults.standard.set(entrySelected, forKey: "entrySelected")
                                 
                                    UserDefaults.standard.set(imagas, forKey: "imagas")
                                 
                                
                                } else {
                                   spamAlert = true
                                }
                            }
              
                            
                        }
                        
                        
                       
                    } message: {
                        Text("You won't be able to edit nor delete an entry once its created. It's a journal entry after all, and you don't edit entries after you make them.")
                    }
                }
                .confirmationDialog("You still have some fields blank.", isPresented: $missingInfo, titleVisibility: .visible) {
                  
                } message: {
                    Text("Please fill in everything before submitting.")
                }
            
             
                        
                }
                    .navigationTitle("Add a new entry")
                   
            }
     
            }
        }
        .padding(.top, 90)
            }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Done") {
                    keyboardOn = false
                }
                .foregroundColor(.blue)
         
            }
        }
     
                 
        }
            
          
            
        }

        }
        .onAppear(perform: authenticate)
        .padding(.top, -150)
        }
  
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            
            let reason = "Protect your journal entries and prevent others from accessing them with Touch ID or Face ID"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                if success {
                    isUnlocked = true
                } else {
             
              
                 
                }
                
            }
            
        } else {
            isUnlocked = true
        }
      
        
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}



