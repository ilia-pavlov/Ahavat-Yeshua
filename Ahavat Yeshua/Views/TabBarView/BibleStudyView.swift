//
//  BibleStudyView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI
import SafariServices

struct VideoLink: Identifiable {
    let id = UUID()
    let title: String
    let url: URL
}

struct BibleStudyView: View {
    @State private var oldTestamentVideos: [VideoLink] = [
        VideoLink(title: "Book of Malachi", url: URL(string: "https://www.youtube.com/watch?v=zVLKnHs5nFY&list=PLqF5Pt_yMO7lcUN6hHO1udbYfAXaeDdJc")!),
        VideoLink(title: "Book of Daniel", url: URL(string: "https://www.youtube.com/watch?v=7gM0bgin0O0&list=PLqF5Pt_yMO7lYb0Sym42iT42cdevaFwFx")!),
        VideoLink(title: "Book of Isaiah", url: URL(string: "https://www.youtube.com/watch?v=6_2IqOlbfhU&list=PLqF5Pt_yMO7mdHHR3PWx7EN60Or7MNYPi")!)
    ]
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(spacing: 4) {
                        Text(" Growth in Faith")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)
                        Text("צמיחה באמונה")
                            .foregroundStyle(.black)
                            .foregroundColor(.secondary)
                    }
                    .multilineTextAlignment(.center)
                    
                    List {
                        Section(header: Text("📜 Old Testament")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top)) {
                                
                                ForEach(oldTestamentVideos) { link in
                                    NavigationLink(destination: SafariView(url: link.url)) {
                                        Label(link.title, systemImage: "video.fill")
                                            .foregroundColor(.blue)
                                            .padding(.vertical, 6)
                                    }
                                }
                                .onMove(perform: moveOldTestament)
                            }
                        
                        Section(header: Text("📖 New Testament")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top)) {
                                BibleLabel(title: "1 Peter", comingSoon: true)
                                BibleLabel(title: "Acts", comingSoon: true)
                                BibleLabel(title: "Galatians", comingSoon: true)
                            }
                    }
                    .environment(\.editMode, editMode)
                    .scrollContentBackground(.hidden)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            editMode?.wrappedValue = editMode?.wrappedValue == .active ? .inactive : .active
                        }
                    }) {
                        Text(editMode?.wrappedValue == .active ? "Done" : "Edit")
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.white.opacity(0.25)) // 👈 your custom background
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
        
    
    private func moveOldTestament(from source: IndexSet, to destination: Int) {
        oldTestamentVideos.move(fromOffsets: source, toOffset: destination)
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

#Preview {
    BibleStudyView()
}
