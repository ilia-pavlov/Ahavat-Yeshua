//
//  FeedView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 4/18/25.
//

import SwiftUI

struct FeedView: View {
    @State private var searchText = ""
    @State private var bookmarkedPosts: Set<Int> = []
    @State private var likedPosts: Set<Int> = []

    let feedMock: FeedMock = .init()

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    // Top bar with Search, Add News, Bookmark
                    HStack {
                        TextField("Search users or posts", text: $searchText)
                            .padding(10)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(8)
                            .foregroundColor(.white)

                        Button {
                            // Add news action
                        } label: {
                            Image(systemName: "plus.app")
                                .font(.title2)
                                .foregroundColor(.white)
                        }

                        Button {
                            // Show bookmarks
                        } label: {
                            Image(systemName: "bookmark")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal)

                    // Posts List
                    List(filteredPosts) { post in
                        PostCardView(
                            post: post,
                            isBookmarked: bookmarkedPosts.contains(post.id),
                            isLiked: likedPosts.contains(post.id),
                            onBookmark: { toggleBookmark(for: post) },
                            onLike: { toggleLike(for: post) }
                        )
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                }
            }
        }
    }

    var filteredPosts: [Post] {
        if searchText.isEmpty {
            return feedMock.dummyPosts
        } else {
            return feedMock.dummyPosts.filter { $0.name.localizedCaseInsensitiveContains(searchText) || $0.content.localizedCaseInsensitiveContains(searchText) }
        }
    }

    private func toggleBookmark(for post: Post) {
        if bookmarkedPosts.contains(post.id) {
            bookmarkedPosts.remove(post.id)
        } else {
            bookmarkedPosts.insert(post.id)
        }
    }

    private func toggleLike(for post: Post) {
        if likedPosts.contains(post.id) {
            likedPosts.remove(post.id)
        } else {
            likedPosts.insert(post.id)
        }
    }
}

struct PostCardView: View {
    let post: Post
    var isBookmarked: Bool
    var isLiked: Bool
    var onBookmark: () -> Void
    var onLike: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading) {
                    Text(post.name).font(.headline)
                    Text(post.timeAgo).font(.caption).foregroundColor(.gray)
                }
                Spacer()
                Button(action: onBookmark) {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(.blue)
                }
            }
            
            Text(post.content)
                .font(.body)
            
            HStack(spacing: 20) {
                Button(action: onLike) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                }
                Button(action: {}) {
                    Image(systemName: "bubble.right")
                }
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
            .padding(.top, 4)
            .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.vertical, 4)
    }
}

struct Post: Identifiable {
    let id: Int
    let name: String
    let timeAgo: String
    let content: String
}

#Preview {
    FeedView()
}

