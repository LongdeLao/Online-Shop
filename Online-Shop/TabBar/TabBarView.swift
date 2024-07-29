//
//  TabBarView.swift
//  Online-Shop
//
//  Created by Longde Lao on 28.07.24.
//

import SwiftUI

//struct CustomTabBar:View {
//    var body: some View {
//        VStack{
//            Spacer()
//            HStack(spacing: 80){
//                VStack{
//                    Image(systemName: "house")
//                    Text("Home")
//                        .font(.system(size: 12))
//                }
//                .tag(1)
//                VStack{
//                    Image(systemName: "list.bullet.clipboard")
//                    Text("Orders")
//                        .font(.system(size: 12))
//                }
//                .tag(2)
//                VStack{
//                    Image(systemName: "person")
//                    Text("Profile")
//                        .font(.system(size: 12))
//                }
//                .tag(3)
//            }
//        }
//    }
//}

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
