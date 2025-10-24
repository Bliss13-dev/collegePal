import SwiftUI

struct MenuPage: View {
    var body: some View {
        NavigationStack { // Use NavigationStack for modern SwiftUI navigation
            ZStack {
                // Background Gradient
                LinearGradient(colors: [Color(red: 0.0, green: 0.0, blue: 0.5), .indigo],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Title and Icon
                    Text("CollegePAL")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Image(systemName: "figure.2")
                        .imageScale(.large)
                        .foregroundColor(.white)
                        .font(.title)
                    
                    // Buttons
                    HStack(spacing: 16) {
                        NavigationLink(destination: EssayHelpView()) {
                            buttonWithIcon(title: "Essay Help", icon: "pencil.circle")
                        }
                        NavigationLink(destination: MoodCheckView()) {
                            buttonWithIcon(title: "Mood Check", icon: "person.line.dotted.person.fill") 
                        }
                        NavigationLink(destination: InterviewPrepView()) {
                            buttonWithIcon(title: "Interview Prep", icon:"pencil.circle") 
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    // Reusable Button View (now just a visual component)
    func buttonWithIcon(title: String, icon: String) -> some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
            Text(title)
                .font(.caption)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.black.opacity(0.2))
        .cornerRadius(10)
    }
}
