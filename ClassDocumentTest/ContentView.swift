//
//  ContentView.swift
//  ClassDocumentTest
//
//  Created by Eric Kampman on 10/12/20.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: ClassDocumentTestDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(ClassDocumentTestDocument()))
    }
}
