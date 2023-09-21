//
//  WebViewRepresentable.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI
import WebKit

struct WebViewRepresentable: UIViewRepresentable {
    let urlString: String
    let coordinator = Coordinator()

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        coordinator
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var webView: WKWebView?

        func start(urlString: String) {
            self.webView = WKWebView()
            if let webView = self.webView {
                webView.navigationDelegate = self
                if let url = URL(string: urlString) {
                    let request = URLRequest(url: url)
                    webView.load(request)
                }
            }
        }

        func goBack() {
            // Check if there is a page to go back to in the WKWebView's history
            if webView?.canGoBack == true {
                webView?.goBack() // Navigate back within the WKWebView
            } else {
                // If there is no page to go back to, dismiss the WebView
                if let viewController = webView?.viewController() {
                    viewController.dismiss(animated: true, completion: nil)
                }
            }
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Enable navigation gestures when the web content is loaded
            webView.allowsBackForwardNavigationGestures = true
        }
    }
}

extension UIView {
    func viewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            responder = nextResponder
        }
        return nil
    }
}
