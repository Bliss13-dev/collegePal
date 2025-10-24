import SwiftUI

struct EssayHelpView: View {
    @State private var essayText = ""
    
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(colors: [Color(red: 0.0, green: 0.0, blue: 0.5), .indigo],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 16) {
                Text("Essay Helper")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Start writing your essay below:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                TextEditor(text: $essayText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .frame(minHeight: 200)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Essay Help")
        }
    }
}


