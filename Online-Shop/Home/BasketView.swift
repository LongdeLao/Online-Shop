//
//  BasketView.swift
//  Online-Shop
//
//  Created by Longde Lao on 28.07.24.
//

import SwiftUI



struct BasketView: View {
    @State private var isExpanded = false
   
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .frame(width: isExpanded ? UIScreen.main.bounds.width * 0.95 : 60, height: UIScreen.main.bounds.height * 0.06)
                .foregroundStyle(.teal)
                .opacity(0.8)
                .padding(.leading,15)
                .animation(.easeInOut, value: isExpanded)
            
            Circle()
                .frame(width: 60, height: 60)
                .foregroundStyle(.cyan)
                .overlay {
                    Image(systemName: "cart.fill")
                        .foregroundStyle(.white)
                        .scaleEffect(1.5)
                }
                .padding(.leading)
                .onTapGesture {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }
                .overlay {
                    VStack {
                        HStack {
                            Spacer()
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: 25, height: 25)
                                .overlay {
                                    Text("\(0)")
                                        .foregroundStyle(.white)
                                }
                        }
                        Spacer()
                    }
                    .frame(width: 80, height: 70, alignment: .topTrailing)
                }
        }
        .background(.clear)
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
    }
}

