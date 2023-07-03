//
//  AppConfig.swift
//  PazaramaExample
//
//  Created by Talip on 26.06.2023.
//

import Foundation

struct AppConfig {
    var isRunningTests: Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
}
