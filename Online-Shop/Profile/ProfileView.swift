//
//  ProfileView.swift
//  Online-Shop
//
//  Created by Longde Lao on 28.07.24.
//

import SwiftUI




struct ProfileView: View {

    var body: some View {
        NavigationView(content: {
            List{
                HStack{
              
                    Image(systemName: "person.circle.fill")
                        .foregroundStyle(.gray)
                        .frame(width: 60,height: 60)
                        .scaleEffect(3.5)
                    VStack(alignment:.leading){
                        Text("User")
                            .font(.title)
                        Text("exampleuser@example.com")
                        
                    }
                }
             
                
                Section("Account & Privacy", content: {
                    NavigationLink(destination: Text("")) {
                        HStack{
                            Image(systemName: "person.text.rectangle.fill")
                            Text("Account Information")
                            
                        }
                       }
                    NavigationLink(destination:PaymentMethodView()) {
                        HStack{
                            Image(systemName: "creditcard.fill")
                            Text("Payment Method")
                            
                        }
                    }
                    NavigationLink(destination: Text("")) {
                        HStack{
                            Image(systemName:"questionmark.circle.fill")
                                .frame(width: 25)
                            Text("Help")
                            
                        }
                    }

                })
            } .navigationTitle("Profile")
            
        })
       
      
    }
}

#Preview {
    ProfileView()
}
