//
//  ClassDocumentTestDocument.swift
//  ClassDocumentTest
//
//  Created by Eric Kampman on 10/12/20.
//

import SwiftUI
import Combine
import UniformTypeIdentifiers

extension UTType {
    static var exampleText: UTType {
        UTType(importedAs: "com.example.plain-text")
    }
}

class ClassDocumentTestDocument: FileDocument, ObservableObject {
   @Published var text: String
	var subscriber: AnyCancellable!
	
    init(text: String = "Hello, world!") {
        self.text = text
		
		setupSink()
    }

    static var readableContentTypes: [UTType] { [.exampleText] }

	required init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
		setupSink()
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = text.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
	
	func setupSink() {
		subscriber = $text.sink(receiveCompletion: { print("Completion: \($0)") },
									receiveValue: { print("Data: \($0)") } )
	}


}
