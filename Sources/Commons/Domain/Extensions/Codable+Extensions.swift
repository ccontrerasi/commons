import Foundation

extension Encodable {
    func getEncodedData() -> Data {
        let encoder = JSONEncoder()
        return try! encoder.encode(self)
    }
}
