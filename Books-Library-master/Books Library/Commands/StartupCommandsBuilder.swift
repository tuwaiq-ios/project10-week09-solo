//
//  StartupCommandsBuilder.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//

import Foundation

protocol Command {
    func execute()
}

final class StartupCommandsBuilder {
    func build() -> [Command] {
        return [
            InitializeAppearanceCommand()
        ]
    }
}
