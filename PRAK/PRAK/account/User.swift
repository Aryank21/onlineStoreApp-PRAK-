import Foundation

struct User: Identifiable, Equatable {
    let id: UUID
    var name: String
    var email: String
    let createdAt: Date
    var address: DeliveryAddress?

    var memberSince: String {
        createdAt.formatted(.dateTime.month(.wide).year())
    }

    var initials: String {
        let parts = name.split(separator: " ")
        let value = parts.prefix(2).compactMap { $0.first.map(String.init) }.joined()
        return value.isEmpty ? "B" : value.uppercased()
    }
}

struct DeliveryAddress: Codable, Equatable {
    var label: String
    var line1: String
    var line2: String
    var city: String
    var pinCode: String

    var formatted: String {
        [line1, line2, "\(city) – \(pinCode)"]
            .filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
            .joined(separator: "\n")
    }

    var isEmpty: Bool {
        line1.trimmingCharacters(in: .whitespaces).isEmpty
            && city.trimmingCharacters(in: .whitespaces).isEmpty
            && pinCode.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

private struct StoredAccount: Codable {
    let id: UUID
    var name: String
    var email: String
    var password: String
    let createdAt: Date
    var address: DeliveryAddress?

    var user: User {
        User(id: id, name: name, email: email, createdAt: createdAt, address: address)
    }
}

enum AuthError: LocalizedError, Equatable {
    case emptyFields
    case invalidEmail
    case weakPassword
    case passwordMismatch
    case userNotFound
    case wrongPassword
    case emailAlreadyRegistered
    case emailInUse

    var errorDescription: String? {
        switch self {
        case .emptyFields: "Please fill in all required fields."
        case .invalidEmail: "Enter a valid email address."
        case .weakPassword: "Password must be at least 6 characters."
        case .passwordMismatch: "Passwords do not match."
        case .userNotFound: "No account found with this email."
        case .wrongPassword: "Incorrect password. Try again."
        case .emailAlreadyRegistered: "An account with this email already exists."
        case .emailInUse: "That email is already used by another account."
        }
    }
}
