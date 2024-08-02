import SwiftUI

struct HomeView: View {
    @State private var itemViewModel = ItemViewModel()
    @State private var user = User(itemsInBasket: [])
    @State private var timeOut = false
 
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
                        if itemViewModel.success{
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
                        } else {
                            VStack {
                                        if timeOut {
                                            VStack {
                                                Text("No connection, please check your internet connection")
                                            }
                                            .padding()
                                        } else {
                                            ProgressView()
                                                .onAppear {
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                                        timeOut = true
                                                    }
                                                }
                                                .padding()
                                        }
                                    }
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
        .refreshable {
            await refreshContent()
        }
        
        
    }
    private func refreshContent() async {
            // Simulate a network refresh or some action
            await Task.sleep(2 * 1_000_000_000) // 2 seconds delay
        
            itemViewModel.fetchProducts()
        if !itemViewModel.products.isEmpty {
            timeOut = false
        } else {
            timeOut = true
        }
            // Optionally reset other state variables if needed
        }
}

#Preview {
    HomeView()
}
