import Foundation

struct Order: Identifiable, Equatable {
    let id: UUID
    let date: Date
    let items: [CartItem]
    let total: Int
    let status: Status

    enum Status: String {
        case confirmed = "Confirmed"
        case shipped = "Shipped"
        case delivered = "Delivered"
    }

    var itemCount: Int { items.reduce(0) { $0 + $1.quantity } }

    var formattedDate: String {
        date.formatted(.dateTime.day().month(.wide).year())
    }

    var orderNumber: String {
        String(id.uuidString.prefix(8).uppercased())
    }
}
