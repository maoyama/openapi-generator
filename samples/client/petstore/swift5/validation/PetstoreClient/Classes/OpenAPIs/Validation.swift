// Validation.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct StringValidationRule {
    public var minLength: Int?
    public var maxLength: Int?
    public var pattern: String?
}

public struct NumericValidationRule<T: Comparable & Numeric> {
    public var minimum: T?
    public var exclusiveMinimum = false
    public var maximum: T?
    public var exclusiveMaximum = false
    public var multipleOf: T?
}

public enum StringValidationErrorKind: Error {
    case minLength, maxLength, pattern
}

public enum NumericValidationErrorKind: Error {
    case minimum, maximum, multipleOf
}

public struct ValidationError<T: Error & Hashable>: Error {
    public fileprivate(set) var kinds: Set<T>
}

public struct Validator {
    public static func validate(_ string: String, with rule: StringValidationRule) throws -> String {
        var error = ValidationError<StringValidationErrorKind>(kinds: [])
        if let minLength = rule.minLength, !(minLength <= string.count) {
            error.kinds.insert(.minLength)
        }
        if let maxLength = rule.maxLength, !(string.count <= maxLength) {
            error.kinds.insert(.maxLength)
        }
        if let pattern = rule.pattern {
            let matches = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
                .matches(in: string, range: .init(location: 0, length: string.utf16.count))
            if matches.isEmpty {
                error.kinds.insert(.pattern)
            }
        }
        guard error.kinds.isEmpty else {
            throw error
        }
        return string
    }

    public static func validate<T: Comparable & BinaryInteger>(_ numeric: T, with rule: NumericValidationRule<T>) throws -> T {
        var error = ValidationError<NumericValidationErrorKind>(kinds: [])
        if let minium = rule.minimum {
            if !rule.exclusiveMinimum && minium <= numeric {
                error.kinds.insert(.minimum)
            }
            if rule.exclusiveMinimum && minium < numeric {
                error.kinds.insert(.minimum)
            }
        }
        if let maximum = rule.maximum {
            if !rule.exclusiveMaximum && numeric <= maximum {
                error.kinds.insert(.maximum)
            }
            if rule.exclusiveMaximum && numeric < maximum {
                error.kinds.insert(.maximum)
            }
        }
        if let multipleOf = rule.multipleOf, !numeric.isMultiple(of: multipleOf) {
            error.kinds.insert(.multipleOf)
        }
        guard error.kinds.isEmpty else {
            throw error
        }
        return numeric
    }

    public static func validate<T: Comparable & FloatingPoint>(_ numeric: T, with rule: NumericValidationRule<T>) throws -> T {
        var error = ValidationError<NumericValidationErrorKind>(kinds: [])
        if let minium = rule.minimum {
            if !rule.exclusiveMinimum && minium <= numeric {
                error.kinds.insert(.minimum)
            }
            if rule.exclusiveMinimum && minium < numeric {
                error.kinds.insert(.minimum)
            }
        }
        if let maximum = rule.maximum {
            if !rule.exclusiveMaximum && numeric <= maximum {
                error.kinds.insert(.maximum)
            }
            if rule.exclusiveMaximum && numeric < maximum {
                error.kinds.insert(.maximum)
            }
        }
        if let multipleOf = rule.multipleOf, numeric.remainder(dividingBy: multipleOf) != 0 {
            error.kinds.insert(.multipleOf)
        }
        guard error.kinds.isEmpty else {
            throw error
        }
        return numeric
    }
}
