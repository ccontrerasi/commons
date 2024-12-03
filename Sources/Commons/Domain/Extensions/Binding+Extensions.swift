import SwiftUI

public extension Binding where Value: Sendable {
    func map<T: Sendable>(get: @escaping @Sendable (Value) -> T?, set: @escaping @Sendable (T?) -> Value) -> Binding<T?> {
        return Binding<T?>(
            get: {
                get(self.wrappedValue)
            },
            set: { newValue in
                self.wrappedValue = set(newValue)
            }
        )
    }
}
