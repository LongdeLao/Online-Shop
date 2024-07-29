//
//  CategoriesFilter.swift
//  Online-Shop
//
//  Created by Longde Lao on 29.07.24.
//

import SwiftUI

struct CategoriesFilter: View {
        private var offsetValue: Double  {
            switch selectedTab {
            case 0:
                -UIScreen.main.bounds.width * 0.294
            case 1:
                +UIScreen.main.bounds.width * 0.001
            case 2:
                +UIScreen.main.bounds.width * 0.294
            default: 0
        }
    }
    @Binding  var selectedTab: Int

    var body: some View {
       Capsule()
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.03)
            .foregroundColor(.teal)
      
            .overlay{
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: UIScreen.main.bounds.width * 0.31, height: UIScreen.main.bounds.height * 0.028)
                        .foregroundColor(.graybg)
                        .offset(x: offsetValue)
                        .animation(.easeIn, value: selectedTab)
                    HStack(spacing: 70){
                        Text("Electronics")
                        
                            .onTapGesture {
                                selectedTab = 0
                            }
                        Text("Jewelery")
                            
                            .onTapGesture {
                                selectedTab = 1
                            }
                        Text("Clothing")
                          
                            .onTapGesture {
                                selectedTab = 2
                            }
                  
                    }
                    .font(.system(size: 12))
                }
            }
        
        
        
        
    }
}

#Preview {
    CategoriesFilter(selectedTab: .constant(1))
}
