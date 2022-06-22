//
//  ContentViewMain.swift
//  iWrite
//
//  Created by Nethan on 16/6/22.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth
import CryptoKit
import Combine



struct ContentView: View {

    @State var currentNonce: String?
    
    @Environment(\.colorScheme) var colorScheme // Saves color scene environment variable inside a variable we made also called colorScheme
   
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    private var isSignedIn:Bool {
        !userId.isEmpty
    }
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }
  

      return result
    }
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }
    

    var body: some View {
        
        

            VStack {
            
                if !isSignedIn {
                 
                    SignUpButton()
               
                
                } else {
         
                    HomeView()
                }
                
              
                
             }
         
        
        
        
    
    }
}

struct SignUpButton: View {
    
    
    @Environment(\.colorScheme) var colorScheme // Saves color scene environment variable inside a variable we made also called colorScheme

    @State var currentNonce: String?
    
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    
    @State private var animateGradient = false
    
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }
    

    
    
    var body: some View {
      
        ZStack {
         
            
            
          
            LinearGradient(colors: [.purple ,.pink], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
                }
            
        VStack(alignment: .center) {
            Spacer()
        Text("        Login. \n   It's Simple.")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(colorScheme == .dark ? .black : .white)
            
            Text("Start making Journal entries, quickly.")
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(colorScheme == .dark ? .black : .white)
            

            
        Spacer()
        Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
      
           
           
           
        }
           
        
        SignInWithAppleButton(.continue) { request in
            
            let nonce = randomNonceString()
            currentNonce = nonce
            
            request.requestedScopes = [.fullName, .email]
            request.nonce = sha256(nonce)
            
            
            

            
        } onCompletion: { result in
            
            
            switch result {
                                case .success(let authResults):
                                    switch authResults.credential {
                                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                        
                                        guard let nonce = currentNonce else {
                                            fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                        }
                                        guard let appleIDToken = appleIDCredential.identityToken else {
                                            fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                        }
                                        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                                            print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                                            return
                                        }
                                        
                                        let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                                        
                                      
                                        
                                        Auth.auth().signIn(with: credential) { (authResult, error) in
                                            if (error != nil) {
                                                // Error. If error.code == .MissingOrInvalidNonce, make sure
                                                // you're sending the SHA256-hashed nonce as a hex string with
                                                // your request to Apple.
                                               
                                                print(error?.localizedDescription as Any)
                                                return
                                            }
                                            print("signed in")
                                            let email = appleIDCredential.email
                                            let userId = appleIDCredential.user
                                            self.userId = userId
                                            self.email = email ?? ""
                                            let fullName = appleIDCredential.fullName
                                            let firstName = fullName?.givenName
                                            let lastName = fullName?.familyName
                                            self.firstName = firstName ?? ""
                                            self.lastName = lastName ?? ""
                                            
                                   

                                         
                                       
                                        }
                                        
                                 
                                        
                                        print("\(String(describing: Auth.auth().currentUser?.uid))")
                                     
                                        
                                    default:
                                        break
                                        
                                    }
                                default:
                                    break
                                }
            
        }
                
           
            
            
        
        .signInWithAppleButtonStyle(
        
            colorScheme == .dark ? .black:.white
        
        )
      
    
    .frame(width: 250, height: 50)
    .padding()
    .cornerRadius(5)
    .padding(.top, 450)
    // What signInWithAppleButtonStyle allows us to set the color of the button to .white, .black or we could do a true false optional thing
    
   
        // if our color scheme environment variable theme is .dark, the our button style is .white, if the colorScheme == .dark is false, our button style .black
        
        
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           
    }
}
