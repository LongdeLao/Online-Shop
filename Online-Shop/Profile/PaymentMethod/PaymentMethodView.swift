//
//  PaymentMethodView.swift
//  Online-Shop
//
//  Created by Longde Lao on 28.07.24.
//

import SwiftUI

struct PaymentMethodView: View {
    @State var sheetIsPresented = false
    var body: some View {
        VStack{
            HStack{
                Spacer()
                
              
          
            }
        }
        .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: { sheetIsPresented.toggle() }) {
                                Image(systemName: "plus")
                                    
                            }
                        }
                    }
        .sheet(isPresented: $sheetIsPresented, content: {
                AddMethodView(sheetIsPresented: $sheetIsPresented)
        })
        

    }
}

#Preview {
    PaymentMethodView()
}
