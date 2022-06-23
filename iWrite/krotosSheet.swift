//
//  krotosSheet.swift
//  iWrite
//
//  Created by Nethan on 23/6/22.
//

import SwiftUI

struct kroc: View {
    var body: some View {
        
        
        VStack {
            VStack {
                Spacer()
                
                ZStack {
                 
                        
                   
                  Circle()
                        .fill(LinearGradient(colors: [.white,.gray,.black], startPoint: .trailing, endPoint: .leading))
                
            .frame(width: 300, height: 300)
                    Text("K")
                        .fontWeight(.bold)
                        .font(.system(size: 140))
                        .foregroundColor(.gray)
                        .frame(width: 300, height: 300)
                        
            }
          Spacer()
        Text("You earned some Krotos \n            and leveled up!")
                    .font(.title)
                    .fontWeight(.bold)
              Spacer()
                Text("We reward you for writing better, longer \n journal entries! Continue to keep up the\ngood work!")
                            .font(.body)
                            .fontWeight(.light)
                Spacer()
            }
            
        }
    }
}

struct kroc_Previews: PreviewProvider {
    static var previews: some View {
        kroc()
    }
}
