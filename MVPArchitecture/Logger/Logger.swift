//
//  Logger.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 23/10/2025.
//

import Foundation

final class Logger {
    static let shared = Logger()
    private init() { }
    
    enum LogLevel: String {
        case info = "ℹ️ INFO"
        case warning = "⚠️ WARNING"
        case error = "❌ ERROR"
        case debug = "🐞 DEBUG"
    }
    
    func log(_ message: String, level: LogLevel = .info) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .medium)
        let logMessage = "[\(timestamp)] [\(level.rawValue)] \(message)"
        print(logMessage)
    }
}
