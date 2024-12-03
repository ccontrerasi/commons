//
//  LoadableState.swift
//  facefootball
//
//  Created by Christian Contreras on 2/11/23.
//

import Foundation
import Combine

public enum LoadableState<Value> {
    case idle
    case loading
    case failed(Error)
    case result(Value?)
    
    public func getResult() -> Value? {
        guard case let .result(value) = self else { return nil }
        
        return value
    }
    
    public func getError() -> Error? {
        guard case let .failed(error) = self else { return nil }
        
        return error
    }
}

extension LoadableState: Equatable {
    
    public static func == (lhs: LoadableState<Value>, rhs: LoadableState<Value>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle): return true
        case (.loading, .loading): return true
        case (.result(_), .result(_)): return true
        case (.failed(_), .failed(_)): return true
            
        case (.idle, .loading): return false
        case (.idle, .failed(_)): return false
        case (.idle, .result(_)): return false
            
        case (.loading, .idle): return false
        case (.loading, .failed(_)): return false
        case (.loading, .result(_)): return false
            
        case (.failed(_), .idle): return false
        case (.failed(_), .loading): return false
        case (.failed(_), .result(_)): return false
            
        case (.result(_), .idle): return false
        case (.result(_), .loading): return false
        case (.result(_), .failed(_)): return false
        }
    }
}
