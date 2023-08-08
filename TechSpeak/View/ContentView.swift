//
//  ContentView.swift
//  TechSpeak
//
//  Created by Joshua Mae on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: TechSentence
    @EnvironmentObject private var corporateViewModel: CorporateSentence

    var body: some View {
        ZStack {
            VStack {
                textBoxes
                buttons
            }
            .padding()
        }
        .background(.ultraThickMaterial)
        .onAppear {
            viewModel.fetchTechBroSentence()
            corporateViewModel.fetchCorpBroSentence()
        }
        .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TechSentence())
            .environmentObject(CorporateSentence())
    }
}

extension ContentView {
    
    private var textBoxes: some View {
        VStack{
            Text("Tech Lingo: ")
                .frame(maxWidth: .infinity, alignment: .leading)
            RoundedRectangle(cornerRadius: 10)
                .fill(.background)
                .overlay(Text(viewModel.sentence.tech)
                    .font(.body)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 10))
            Text("Corporate Slang:")
                .frame(maxWidth: .infinity, alignment: .leading)
            RoundedRectangle(cornerRadius: 10)
                .fill(.background)
                .overlay(Text(corporateViewModel.corporateSentence.corporate)
                    .font(.body)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 10))
        }
    }
    
    private var buttons: some View {
        VStack{
            Button {
                Task {
                    viewModel.fetchTechBroSentence()
                }
            } label: {
                Text("New Tech Jargon")
                    .frame(maxWidth: 200)
            }
            .clipShape(Capsule())
            Button {
                Task {
                    corporateViewModel.fetchCorpBroSentence()
                }
            } label: {
                Text("New Corporate Jargon")
                    .frame(maxWidth: 200)
            }
            .clipShape(Capsule())
            Button {
                NSApplication.shared.terminate(nil)
            } label: {
                Text("Quit")
            }
            .clipShape(Capsule())
            .keyboardShortcut("q")
        }

    }
}

