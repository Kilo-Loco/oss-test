//
//  oss_testApp.swift
//  oss-test
//
//  Created by Lee, Kyle on 9/8/21.
//

import Amplify
import AWSCognitoAuthPlugin
import AWSAPIPlugin
import AWSDataStorePlugin
import AWSS3StoragePlugin
import SwiftUI

@main
struct oss_testApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        configureAmplify()
    }
    
    func configureAmplify() {
        do {
            let models = AmplifyModels()
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: models))
            try Amplify.add(plugin: AWSDataStorePlugin(modelRegistration: models))
            try Amplify.add(plugin: AWSS3StoragePlugin())
            try Amplify.configure()
            print("configured amplify")
            
        } catch {
            print(error)
        }
    }
}
