//
// FormatTest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct FormatTest: Codable, JSONEncodable, Hashable {

    public var integer: Int?
    public var int32: Int?
    public var int64: Int64?
    public var number: Double
    public var float: Float?
    public var double: Double?
    public var string: String?
    public var byte: Data
    public var binary: URL?
    public var date: Date
    public var dateTime: Date?
    public var uuid: UUID?
    public var password: String
    public var bigDecimal: Decimal?

    public init(integer: Int? = nil, int32: Int? = nil, int64: Int64? = nil, number: Double, float: Float? = nil, double: Double? = nil, string: String? = nil, byte: Data, binary: URL? = nil, date: Date, dateTime: Date? = nil, uuid: UUID? = nil, password: String, bigDecimal: Decimal? = nil) {
        self.integer = integer
        self.int32 = int32
        self.int64 = int64
        self.number = number
        self.float = float
        self.double = double
        self.string = string
        self.byte = byte
        self.binary = binary
        self.date = date
        self.dateTime = dateTime
        self.uuid = uuid
        self.password = password
        self.bigDecimal = bigDecimal
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case integer
        case int32
        case int64
        case number
        case float
        case double
        case string
        case byte
        case binary
        case date
        case dateTime
        case uuid
        case password
        case bigDecimal = "BigDecimal"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(integer, forKey: .integer)
        try container.encodeIfPresent(int32, forKey: .int32)
        try container.encodeIfPresent(int64, forKey: .int64)
        try container.encode(number, forKey: .number)
        try container.encodeIfPresent(float, forKey: .float)
        try container.encodeIfPresent(double, forKey: .double)
        try container.encodeIfPresent(string, forKey: .string)
        try container.encode(byte, forKey: .byte)
        try container.encodeIfPresent(binary, forKey: .binary)
        try container.encode(date, forKey: .date)
        try container.encodeIfPresent(dateTime, forKey: .dateTime)
        try container.encodeIfPresent(uuid, forKey: .uuid)
        try container.encode(password, forKey: .password)
        try container.encodeIfPresent(bigDecimal, forKey: .bigDecimal)
    }

    public struct IntegerValidator {
        public struct ValidationError: Error {
            public enum ErrorKind: Error {
                case minimum
                case maximum
            }
            public fileprivate(set) var kinds: Set<ErrorKind>
        }
    }

    public struct Int32Validator {
        public struct ValidationError: Error {
            public enum ErrorKind: Error {
                case minimum
                case maximum
            }
            public fileprivate(set) var kinds: Set<ErrorKind>
        }
    }

    public struct NumberValidator {
        public struct ValidationError: Error {
            public enum ErrorKind: Error {
                case minimum
                case maximum
            }
            public fileprivate(set) var kinds: Set<ErrorKind>
        }
    }

    public struct FloatValidator {
        public struct ValidationError: Error {
            public enum ErrorKind: Error {
                case minimum
                case maximum
            }
            public fileprivate(set) var kinds: Set<ErrorKind>
        }
    }

    public struct DoubleValidator {
        public struct ValidationError: Error {
            public enum ErrorKind: Error {
                case minimum
                case maximum
            }
            public fileprivate(set) var kinds: Set<ErrorKind>
        }
    }

    public struct StringValidator {
        public struct ValidationError: Error {
            public enum ErrorKind: Error {
                case pattern
            }
            public fileprivate(set) var kinds: Set<ErrorKind>
        }

        public static let pattern = "/[a-z]/i"

        public static func validate(string: String) throws -> String {
            var error = ValidationError(kinds: [])

            let matches = try NSRegularExpression(pattern: pattern, options: .caseInsensitive).matches(in: string, range: .init(location: 0, length: string.utf16.count))
            if matches.isEmpty {
                error.kinds.insert(.pattern)
            }

            guard error.kinds.isEmpty else {
                throw error
            }
            return string
        }
    }

    public struct PasswordValidator {
        public struct ValidationError: Error {
            public enum ErrorKind: Error {
                case minLength
                case maxLength
            }
            public fileprivate(set) var kinds: Set<ErrorKind>
        }

        public static let minLength = 10
        public static let maxLength = 64

        public static func validate(password: String) throws -> String {
            var error = ValidationError(kinds: [])

            if password.count < minLength {
                error.kinds.insert(.minLength)
            }
            if password.count > maxLength {
                error.kinds.insert(.maxLength)
            }

            guard error.kinds.isEmpty else {
                throw error
            }
            return password
        }
    }
}

