

// TODO: Make the reset button reset the values to 0 when is pressed






import SwiftUI
import WebKit

struct SettingsView: View {
    
    @State private var showGithubView = false
    @State private var showIconView = false
    var body: some View {
        VStack {
            Text("Version")
                .font(.title)
                .bold()
                .padding(30)
            
            Text("0.0.8")
                .font(.largeTitle)
                .bold()
                .padding(30)
        
            Text("ALPHA")
                .font(.system(size: 80, weight: .heavy))
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                .fill(
            LinearGradient(
                colors: [.red, .orange],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
                            )
                        )
                .shadow(color: .black.opacity(0.3), radius: 10, y: 5)
                )
                .rotationEffect(.degrees(-15))
                .padding(.bottom, 20)
                .shadow(color: .orange.opacity(0.5), radius: 20, y: 10)
                .padding(.bottom,30)
            
            List {
                Button("App Info") {
                                    showIconView.toggle()
                                }
                .sheet(isPresented: $showIconView) {
            NavigationStack {
                        AboutView()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
            ToolbarItem(placement:
                .navigationBarTrailing) {
                                                
                                            }
                                        }
                                    }
                                }
                .tint(.orange)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                 Button {
                                        showIconView = false
                                    } label: {
                        Image(systemName: "xmark.circle.fill")
                .foregroundStyle(.gray)
                                    }
                                }
                            }
                
                
                Button{
                    showGithubView.toggle()
                } label: {
                    Label("Github Page", systemImage: "staroflife.circle.fill")
                }
                .sheet(isPresented: $showGithubView) {
            NavigationStack {
                        WebView(url: URL(string: "https://github.com/intelligencecore/swiftCalculator")!)
                .navigationTitle("GitHub")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
             ToolbarItem(placement: .navigationBarTrailing) {
                 Button {
                                        showGithubView = false
                                    } label: {
                        Image(systemName: "xmark.circle.fill")
                .foregroundStyle(.gray)
                                    }
                                }
                            }
                    }
                }
                .tint(.blue)
                
//                Button {
//                    // Reset action
//                } label: {
//                    Label("Reset to default", systemImage: "exclamationmark.arrow.trianglehead.counterclockwise.rotate.90")
//                }
//                .foregroundStyle(.red)
            }
            .scrollContentBackground(.hidden)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
