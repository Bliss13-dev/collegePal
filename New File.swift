import SwiftUI

// MARK: - Question Model
struct Question {
    let text: String
    let choices: [String]
    let correctAnswer: String
}

// MARK: - Quiz View
struct InterviewPrepView: View {
    let questions: [Question] = [
        Question(
            text: "What planet is known as the Red Planet?",
            choices: ["A. Earth", "B. Mars", "C. Jupiter", "D. Venus"],
            correctAnswer: "B. Mars"
        ),
        Question(
            text: "What is the chemical symbol for water?",
            choices: ["A. CO2", "B. H2O", "C. O2", "D. HO2"],
            correctAnswer: "B. H2O"
        ),
        Question(
            text: "Which gas do plants absorb?",
            choices: ["A. Oxygen", "B. Nitrogen", "C. Carbon Dioxide", "D. Hydrogen"],
            correctAnswer: "C. Carbon Dioxide"
        )
    ]
    
    @State private var currentIndex = 0
    @State private var selectedAnswer: String? = nil
    @State private var resultText: String = ""
    @State private var score = 0
    @State private var showResult = false
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1).ignoresSafeArea() // background
            
            VStack(spacing: 20) {
                if currentIndex < questions.count {
                    // Question
                    Text(questions[currentIndex].text)
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.blue)
                        .padding(.horizontal)
                    
                    // Choices
                    ForEach(questions[currentIndex].choices, id: \.self) { choice in
                        Button(action: {
                            selectedAnswer = choice
                            if choice == questions[currentIndex].correctAnswer {
                                resultText = "Correct! ✅"
                                score += 1
                            } else {
                                resultText = "Incorrect ❌"
                            }
                            showResult = true
                        }) {
                            Text(choice)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .disabled(showResult) // Disable after answering
                    }
                    
                    // Result
                    if showResult {
                        Text(resultText)
                            .font(.headline)
                            .foregroundColor(resultText == "Correct! ✅" ? .green : .red)
                            .padding(.top)
                        
                        Button("Next") {
                            currentIndex += 1
                            selectedAnswer = nil
                            resultText = ""
                            showResult = false
                        }
                        .padding(.top)
                        .foregroundColor(.blue)
                    }
                } else {
                    // Quiz Complete
                    Text("🎉 Quiz Complete!\nScore: \(score)/\(questions.count)")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.blue)
                }
            }
            .padding()
        }
    }
}

// MARK: - Preview
#Preview {
    MenuPage()
}
