//
//  ClassDocumentTestApp.swift
//  ClassDocumentTest
//
//  Created by Eric Kampman on 10/12/20.
//

import SwiftUI

@main
struct ClassDocumentTestApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: ClassDocumentTestDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
