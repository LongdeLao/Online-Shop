import SwiftUI

struct HomeView: View {
    @State private var itemViewModel = ItemViewModel()
    @State private var user = User(itemsInBasket: [])
    @State var requestedCategory = 0
    var categoryString: String {
        switch requestedCategory {
        case 0:
            "Electronics"
        case 1:
            "Jewelery"
        case 2:
            "Clothing"
        default:
            "Electronics"
        }
    }

    


    var body: some View {
        ZStack(alignment: .bottomLeading) {
            NavigationView {
                ScrollView {
                    LazyVStack(spacing: 20) {
                        CategoriesFilter(selectedTab: $requestedCategory)
                        ForEach(itemViewModel.computeProperties(category: categoryString)) { product in
                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: product.image)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(height: 200)
                                .cornerRadius(10)

                                Text(product.title)
                                    .font(.headline)
                                    .padding(.top, 5)

                                HStack {
                                    Text("$\(product.price, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    StarRating(rating: product.rating.rate, maxRating: 5)
                                        .scaleEffect(0.8)
                                    Text("(\(product.rating.count))")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                    AddToBasket()
                                }

                                Text(product.description)
                                    .font(.body)
                                    .lineLimit(2)
                                    .padding(.top, 2)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
                .navigationTitle("Products")
                .onAppear {
                    itemViewModel.fetchProducts()
                }
            }

            
            BasketView()
                .padding(.bottom, 20)
        }
    }
}

#Preview {
    HomeView()
}
