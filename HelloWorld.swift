//
//  HelloWorld.swift
//  HelloWorldExtension
//
//  Created by Wesley de Groot on 6 October 2022.
//

import Foundation
import AEExtensionKit

public class HelloWorldExtension: ExtensionInterface {
    var api: ExtensionAPI
    var AuroraAPI: AuroraAPI = { _, _ in }

    init(api: ExtensionAPI) {
        self.api = api
        print("Hello from HelloWorldExtension: \(api)!")
    }

    public func register() -> ExtensionManifest {
        return .init(
            name: "HelloWorldExtension",
            displayName: "HelloWorldExtension",
            version: "1.0",
            minAEVersion: "1.0"
        )
    }

    public func respond(action: String, parameters: [String: Any]) -> Bool {
        print("respond(action: String, parameters: [String: Any])", action, parameters)

        if action == "registerCallback" {
            if let api = parameters["callback"] as? AuroraAPI {
                AuroraAPI = api
            }
        }

        return true
    }
}

@objc(HelloWorldBuilder)
public class HelloWorldBuilder: ExtensionBuilder {
    public override func build(withAPI api: ExtensionAPI) -> ExtensionInterface {
        return HelloWorldExtension(api: api)
    }
}
