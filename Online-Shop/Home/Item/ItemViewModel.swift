import SwiftUI
import Observation

@Observable
class ItemViewModel {
    var products: [ItemModel] = []
    var categories: [String] = []
    
    func fetchProducts() {
        print("fetching data...")
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return }
          
            do {
                let productResponses = try JSONDecoder().decode([ProductResponse].self, from: data)
                DispatchQueue.main.async {
                    self?.products = productResponses.map { productResponse in
                        ItemModel(
                            id: productResponse.id,
                            title: productResponse.title,
                            price: productResponse.price,
                            description: productResponse.description,
                            category: productResponse.category,
                            image: productResponse.image,
                            rating: ItemModel.Rating(rate: productResponse.rating.rate, count: productResponse.rating.count),
                            
                            count: 0 // Initial count
                        )
                    }
                    self?.extractCategories()
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func extractCategories() {
        let allCategories = products.map { $0.category }
        categories = Array(Set(allCategories)).sorted()
        print("Categories: \(categories)")
    }
}
