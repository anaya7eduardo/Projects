/// Enum default syntax and usage

enum SomeEnumeration {
    // enumeration definition goes here
    // Enums defines a common type for a group of related values and
    // enables us to work with those values in a type-safe way within our code.
}

/// Enum raw values

enum Airport: String {
    case vancouver = "YYC"
    case sanFrancisco = "SFO"
    case paris = "CDG"
    case atlanta = "ATL"
}

let airportW = Airport.vancouver.rawValue
print("Welcome to \(airportW) airport!")

/// Enum associate values

enum Buses {
    case chicago
    case newYork(busCompany: String)
    case mexicoCity(busCompany: String)
    case japan(busCompany: String)
}

let busC = Buses.japan(busCompany: "TOKYO EXPRESS")
print(busC)

/// Enum methods

enum Currency {
    case Penny
    case Nickel
    case Dime
    case Quarter
    case Washington
    case Lincoln
    case Hamilton
    case Jackson
    case SGrant
    case Franklin
    
    func currencyType() -> String {
        switch self {
        case .Penny, .Nickel, .Dime, .Quarter:
            return "Coin"
        default:
            return "Bill"
        }
    }
}

Currency.Dime.currencyType()
Currency.Jackson.currencyType()
Currency.Penny.currencyType()

/// Enum computed Properties

enum Abecedary {
    case A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z
    
    var charType: String {
        self == .A || self == .E || self == .I || self == .O || self == .U ? "Vowel" : "Non-Vowel"
    }
}

Abecedary.E.charType
Abecedary.X.charType
Abecedary.I.charType
Abecedary.T.charType
