import Foundation

public extension Encodable {
    func getEncodedData() -> Data {
        let encoder = JSONEncoder()
        return try! encoder.encode(self)
    }
}
