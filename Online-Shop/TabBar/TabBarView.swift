//
//  TabBarView.swift
//  Online-Shop
//
//  Created by Longde Lao on 28.07.24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        ZStack{
            TabView{
                
             HomeView()
                .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                Text("Orders")
                    .tabItem {
                        Image(systemName: "list.bullet.clipboard")
                        Text("Orders")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                
                
            }.tint(.teal)
            VStack {
                Spacer()
                Divider()
                    .background(Color.gray)
                    .frame(height: 1)
                    .offset(y: -49)
            }
        }
    }
}

#Preview {
    TabBarView()
}
