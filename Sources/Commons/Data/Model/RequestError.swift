import Foundation

public enum RequestError: Error, Equatable {
    case commonError
    case notInternet
    case timeout
    case incorrectURL
    case dataEmpty
    case mapError(Data)
    case managersHerency
    case registerNotFound
}

public struct RequestErrorModel: Codable {
    let errorCode: Int
    let errorDes: String
    let errorUser: String
}
