import Foundation

extension Int {
    var inrFormatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en_IN")
        let amount = formatter.string(from: NSNumber(value: self)) ?? "\(self)"
        return "₹\(amount)"
    }
}

struct Product: Identifiable, Equatable {
    let id: Int
    let name: String
    let priceValue: Int
    let category: String
    let fit: String
    let description: String
    let imageURL: String
    let sizes: [String]

    var price: String { priceValue.inrFormatted }
}
