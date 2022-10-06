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

    init(api: ExtensionAPI) {
        self.api = api
        print("Hello from HelloWorldExtension: \(api)!")
    }
}

@objc(HelloWorldBuilder)
public class HelloWorldBuilder: ExtensionBuilder {
    public override func build(withAPI api: ExtensionAPI) -> ExtensionInterface {
        return HelloWorldExtension(api: api)
    }
}
