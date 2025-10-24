import SwiftUI

struct MoodCheckView: View {
    
    @State private var selectedMood: String? = nil
    @State private var navigateToConnect = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Gradient
                LinearGradient(colors: [Color(red: 0.0, green: 0.0, blue: 0.5), .indigo],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Title
                    Text("Hey Buddy! How are you feeling today?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("PrimaryBlue"))
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    // Mood selection buttons
                    VStack(spacing: 12) {
                        HStack(spacing: 12) {
                            moodButton(title: "Happy", color: Color("LightBlue"))
                            moodButton(title: "Stressed", color: Color("MidBlue"))
                        }
                        HStack(spacing: 12) {
                            moodButton(title: "Tired", color: Color("DarkBlue"))
                            moodButton(title: "Anxious", color: Color("PrimaryBlue"))
                        }
                    }
                    .padding(.horizontal)
                    
                    // Show content based on selected mood
                    if let mood = selectedMood {
                        moodContent(for: mood)
                        
                        Button(action: {
                            navigateToConnect = true
                        }) {
                            Text("Peer Connect")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("PrimaryBlue"))
                                .cornerRadius(12)
                        }
                        .padding(.top)
                        
                        // Navigation trigger
                        NavigationLink(destination: StudentConnectView(), isActive: $navigateToConnect) {
                            EmptyView()
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Mood Check")
        }
    }
    
    // MARK: - Mood Button
    func moodButton(title: String, color: Color) -> some View {
        Button(action: {
            selectedMood = title
        }) {
            Text(title)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(color)
                .cornerRadius(10)
        }
    }
    
    // MARK: - Mood Content
    func moodContent(for mood: String) -> some View {
        VStack(spacing: 10) {
            Text("You selected: \(mood)")
                .font(.headline)
                .foregroundColor(Color("PrimaryBlue"))
            
            Group {
                switch mood {
                case "Happy":
                    Text("Keep smiling! Maybe share your happiness with a friend.")
                case "Stressed":
                    Text("Take a deep breath. Try this 5-min meditation on YouTube!")
                case "Tired":
                    Text("How about a short nap or a gentle stretch?")
                case "Anxious":
                    Text("Listen to calming music or try a grounding exercise.")
                default:
                    EmptyView()
                }
            }
            .font(.subheadline)
            .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

// MARK: - Student Connect View
struct StudentConnectView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Student Connect is Coming Soon!")
                .font(.largeTitle)
                .padding()
            
            Text("This is where students will be able to chat and support each other.")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

// MARK: - Preview
#Preview {
    MoodCheckView()
}
