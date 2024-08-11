//
//  ContentView.swift
//  CGPA Calc
//
//  Created by Irfan on 03/08/24.
//

import SwiftUI
import SwiftData



struct ContentView: View {
    
    init() {
        
            UITabBar.appearance().unselectedItemTintColor = UIColor.white
        }
    var body: some View{
        
        TabView{
            
            CalcView().tabItem { Label("Calculate", systemImage: "plus.rectangle") }
            
            HomeView(userData: .constant(userData())).tabItem { Label("Tracker", systemImage: "record.circle")}
            
            
            
            
        }
        
    }
    
}

#Preview {
    ContentView()
}

