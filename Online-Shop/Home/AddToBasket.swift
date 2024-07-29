import SwiftUI

struct AddToBasket: View {
  

    var body: some View {
        HStack {
            Circle()
                .frame(width: 20, height: 20)
                .foregroundStyle(.teal)
                .overlay {
                    Image(systemName: "minus")
                        .foregroundStyle(.graybg)
                }
                .onTapGesture {
                    
                    }
                }

            Text("\(0)")

            Circle()
                .frame(width: 20, height: 20)
                .foregroundStyle(.teal)
                .overlay {
                    Image(systemName: "plus")
                        .foregroundStyle(.graybg)
                }
                .onTapGesture {
                  
                }
        }
    }


