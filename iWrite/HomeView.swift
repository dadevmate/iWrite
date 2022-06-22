//
//  ContentView.swift
//  iWrite
//
//  Created by Nethan on 23/5/22.
//

import SwiftUI
import Foundation
import LocalAuthentication
 


struct HomeView: View {
   
  @State private var titles : [String] =  UserDefaults.standard.object(forKey: "titles") as? [String] ?? []

    @State private var animateGradient = false
    
    @State private var isUnlocked = false
 @State private var texties: [String] = UserDefaults.standard.object(forKey: "texties") as? [String] ?? []

    @State var shopShown = false
 @State var purchaseSuccess = false
    @State var purchaseFail = false
  @State private var dates: [Date] = UserDefaults.standard.object(forKey: "dates") as? [Date] ?? []

    @State var spamAlert = false
    
    @AppStorage("sheetShow") var showingSheet = true
@State var textValue = ""
    @State var addEntry = false
@State private var presentSheet = false


    @State private var entrySelected: [Int] = UserDefaults.standard.object(forKey: "entrySelected") as? [Int] ?? []
    @AppStorage("entry") private var entry = 0

    @State private var title = ""
    @State private var text = ""
    @State private var date = ""
    @State var postsPresent = false
    @State var presentAlert = false
    @State var saveData = false
    @State var level = 0
    @State var aboutSheet = false
    @State var help = false
    @State var profile = false
    @State var missingInfo = false
    @State var selectedDate = Date.now
    @FocusState private var keyboardOn: Bool
   
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    @State var bagShown = false

@AppStorage("krotos") var krotos = 5
@AppStorage("characters") var characters = 150
@AppStorage("increaseKrotos") var increaseKrotos = 1
@State var avatarEquipped = false

@State var imagesOwned = UserDefaults.standard.object(forKey: "imagesOwned") as? [String] ?? []
  
@AppStorage("imageSelected") var imageSelected = "person.crop.circle.badge.questionmark.fill"


    
    var body: some View {
        
    
        
        VStack {
            
     
            if isUnlocked == false {
                VStack {
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
            }
            
            
        if isUnlocked {
     
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
            
       
        
            VStack {
                
              
            
            
            HStack {
               
        Spacer()
                Spacer()
        Text("YouWrite")
                .font(.system(size: 55))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.5, green: 0.4, blue: 0.8))
                
                .padding(.top, -125)
                
           
                Spacer()
                          Spacer()
                          Spacer()
                          Spacer()
                Spacer()
               
            }
                
                HStack {
                    Spacer()
                    Spacer()
                Text("Hello, \(firstName)!")
             
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color(red: 0.3, green: 0.4, blue: 0.8))
             
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
        
                
                }
             
            }
            VStack {
                
             
                Divider()
                    .background(Color(red: 0.5, green: 0.4, blue: 0.8))
                    .padding(.top, -110)
                    .frame(width: 350)
                
              
               
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
                                BannerAd(unitId: "ca-app-pub-6142532326654511/8733697450")
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
                    Form {
                        Section {
                            ForEach(entrySelected, id: \.self) { hi in
                                Section {
                                    
                                    Button(action:{
                                        presentSheet = true
                                    }) {
                                        HStack {
                                        Image(systemName: "\(hi).circle.fill")
                                                .foregroundColor(Color.primary)
                                        Text("\(titles[hi])")
                                                .foregroundColor(Color.primary)
                                        }
                                    }
                                    .sheet(isPresented: $presentSheet) {
                                        
                                        List {
                                    
                                   Spacer()
                                    
                                            HStack {
                                                Spacer()
                                   Text("\(titles[hi])")
                                        .fontWeight(.bold)
                                        .font(.title)
                                                Spacer()
                                            }
                   Spacer()
                                    
                                    
                                    HStack {
                                        Spacer()
                                    Text("\(dates[hi])")
                                            .fontWeight(.light)
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(texties[hi])")
                                        .font(.body)
                                    
                                    Spacer()
                                    Spacer()
                                            Spacer()
                                            Spacer()
                               
                                        }
                                        Spacer()
                                }
                                    
                                    let ad = 5
                                    
                                    if hi % ad == 0 {
                                        BannerAd(unitId: "ca-app-pub-6142532326654511/8733697450")
                                    }
                                }
                           }
                        }
                       }
                    .navigationTitle("My Entries")
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
                
                
                Text("            Krotos is the virtual currency in \n            our app. Get more of it by writing \n more entries. The more you write, the more \n            Krotos you get each time. However, \n                  there is a certain number of \n             characters you must write to get \n                                     Krotos. \n \n The character requirement increases as \n you write more entries. However, you do \n get more Krotos each time you write a \n new entry if the character limit \n is met. \n \n Krotos can be used to purchase \n profile images and other special perks,\n which are coming soon! Stay tuned!")
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
      
                          
                        
                        Text("Name: \(firstName) \(lastName) \n")
                            .fontWeight(.medium)
                            .font(.body)
                            Spacer()
                        Text("Email: \(email)")
                                 .fontWeight(.medium)
                                 .font(.body)
                      
                            Spacer()
                        Text("Krotos: \(krotos)")
                                 .fontWeight(.medium)
                                 .font(.body)
                                 .padding(.top, 10)
                            Spacer()
                        Text("Level: \(level)")
                                 .fontWeight(.medium)
                                 .font(.body)
                                 .padding(.top, 10)
                        
                    
                    Spacer()
                            VStack {
              
                    Text("When you delete this app, your Krotos will be reset. To sign out, go to Settings > Your name > Passwords & Security > Apps using Apple ID > iWrite > Stop using Apple ID.")
                            .fontWeight(.ultraLight)
                            .font(.caption2)
                            .padding()
                                
                       Text(" Email and name not showing up?\n Please sign out as stated above and sign in again.")
                           .fontWeight(.ultraLight)
                            .font(.caption2)
                            .padding()
                            }
                        }
                    }
         
                }
                        
                        
                }
            
                    Button {
                   
                       shopShown = true
                        
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
                        
                        Text("    Shop with your Krotos. \n Buy Avatars for your Profile.")
                            .fontWeight(.light)
                            .font(.body)
                                
                                
                                List {
                                    
                                    
                                    VStack {
                                    
                                    Section {
                                        
                                        HStack {
                                        
                                        Text("Balance: \(krotos) Krotos")
                                            .fontWeight(.heavy)
                                            .font(.body)
                                            Spacer()
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
                                    
                                    BannerAd(unitId: "ca-app-pub-6142532326654511/8733697450")
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
                                    BannerAd(unitId: "ca-app-pub-6142532326654511/8733697450")
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
                                    
                                    BannerAd(unitId: "ca-app-pub-6142532326654511/8733697450")
                                    
                              
                                }.alert("Purchase successful", isPresented: $purchaseSuccess) {
                                    
                                } message: {
                                    Text("Enjoy your new Avatar!")
                                }
                                .alert("Purchase failed", isPresented: $purchaseFail) {
                                   
                                } message: {
                                    Text("Something went wrong. Perhaps you already own this item or you don't have enough Krotos to buy it.")
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
                        
                        
                        BannerAd(unitId: "ca-app-pub-6142532326654511/8733697450")
                         
                       
                Button {
            addEntry = true
                } label: {
                   
        
                    Spacer()
                     Spacer()
            
                    Spacer()
                     Spacer()
                  
                Spacer()
                 Spacer()
               
                    HStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                 
             
                
                        VStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 70))
                        .padding(.horizontal, -80)
                        }
                .foregroundColor(Color(red: 0.5, green: 0.4, blue: 0.8))
                        
                        Spacer()
                        Spacer()
                   
                    }
              
 Spacer()
               Spacer()
                    
                }
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
                
            } .sheet(isPresented: $addEntry) {
                Spacer()
                
                VStack {
                    Spacer()
                Text("Add a new entry")
                    .font(.title)
                    .fontWeight(.thin)
                Spacer()
                 
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
          
                    HStack {
                    Spacer()
                    DatePicker(selection: $selectedDate) {
                        Text("Select a date:")
                    }
                    Spacer()
                    }
               
                    TextField("Title:", text: $title)
                            .frame(width: 200)
                            .cornerRadius(10)
                            .textFieldStyle(
                                RoundedBorderTextFieldStyle()
                            )
                            .focused($keyboardOn)
          
                }
       Spacer()
                   
                TextEditor(text: $text)
                    .frame(width: 300.0, height: 200)
                    .border(Color.primary,width: 1)
                    .focused($keyboardOn)
                    
                    Spacer()
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
                        .alert("You've already submitted a similar entry", isPresented: $spamAlert) {
                            
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
                                
                                if text.count > characters {
                                    krotos += increaseKrotos
                                    characters += 150
                                    increaseKrotos += 1
                                    level += 1
                                }
                                texties.append(text)
                                titles.append(title)
                                
                       dates.append(selectedDate)
                                entrySelected.append(entry)
                                    
                                    addEntry = false
                                entry += 1
                                
                                text = ""
                                date = ""
                                title = ""
                                saveData = false
                                
                            
                               
                                UserDefaults.standard.set(titles, forKey: "titles")
                                
                                UserDefaults.standard.set(dates, forKey: "dates")
                                UserDefaults.standard.set(texties, forKey: "texties")
                                UserDefaults.standard.set(entrySelected, forKey: "entrySelected")
                                
                                } else {
                                   spamAlert = true
                                }
                            }
              
                            
                        }
                       
                        
                       
                    } message: {
                        Text("You won't be able to edit this entry after you create it. It's a journal entry after all.")
                    }
                }
                .alert("You still have some fields blank.", isPresented: $missingInfo) {
                  
                } message: {
                    Text("Please fill in everything before submitting.")
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


