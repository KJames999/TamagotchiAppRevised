//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by James, Killian (NA) on 20/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tamagotchi = BaseTamagotchi(name: "Ben")
    
    var body: some View {
        VStack {
            Text("welcome to your tamagotchi")
                .font(.callout)
                .fontWeight(.heavy)
                .bold()
                .foregroundColor(.blue)
                .padding()

            VStack(alignment: .leading, spacing: 20) {
                Text(tamagotchi.getDetails())
                Button("Feed", action: {
                    tamagotchi.feed()
                    
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
