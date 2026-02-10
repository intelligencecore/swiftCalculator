import SwiftUI
import WebKit

//this view uses Webkit to show a website inside the view.

// WebView wrapper
struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

// Your Internet tab
struct InternetView: View {
    var body: some View {
        NavigationStack {
            WebView(url: URL(string: "https://www.apple.com")!)
                .navigationBarTitleDisplayMode(.inline)
                .ignoresSafeArea(.container)
        }
    }
}

#Preview {
    InternetView()
}
