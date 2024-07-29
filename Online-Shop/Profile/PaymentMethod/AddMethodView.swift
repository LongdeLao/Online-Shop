//
//  AddPaymentMethodView.swift
//  Online-Shop
//
//  Created by Longde Lao on 28.07.24.
//

import SwiftUI

struct AddMethodView: View {
    @Binding  var sheetIsPresented: Bool
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Button(action: {sheetIsPresented.toggle()}, label: {
                        Image(systemName: "xmark.circle.fill")
                            .scaleEffect(1.5)
                    })
                    .padding(20)
                }
                List{
                    Text("Item 1")
                }
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    AddMethodView(sheetIsPresented: .constant(false))
}
