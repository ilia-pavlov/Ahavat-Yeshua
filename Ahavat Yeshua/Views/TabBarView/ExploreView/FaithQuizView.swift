//
//  FaithQuizView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 4/18/25.
//

import SwiftUI

struct QuizQuestion {
    let question: String
    let choices: [String]
    let correctAnswerIndex: Int
}

struct FaithQuizView: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswerIndex: Int? = nil
    @State private var score = 0
    @State private var showResult = false
    @State private var isAnswerSelected = false

    let questions: [QuizQuestion] = [
        QuizQuestion(
            question: "What is the first book of the Bible?",
            choices: ["Genesis", "Exodus", "Psalms", "Matthew"],
            correctAnswerIndex: 0
        ),
        QuizQuestion(
            question: "Who built the Ark?",
            choices: ["Moses", "Noah", "David", "Abraham"],
            correctAnswerIndex: 1
        ),
        QuizQuestion(
            question: "How many disciples did Jesus have?",
            choices: ["10", "11", "12", "13"],
            correctAnswerIndex: 2
        )
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Faith Quiz")
                .font(.largeTitle)
                .bold()

            Text(questions[currentQuestionIndex].question)
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)

            ForEach(0..<questions[currentQuestionIndex].choices.count, id: \.self) { index in
                Button {
                    selectedAnswerIndex = index
                    isAnswerSelected = true
                    if index == questions[currentQuestionIndex].correctAnswerIndex {
                        score += 1
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        moveToNextQuestion()
                    }
                } label: {
                    Text(questions[currentQuestionIndex].choices[index])
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(buttonBackground(for: index))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                .disabled(isAnswerSelected) // Disable button after selection
            }

            Spacer()
        }
        .padding()
        .alert(isPresented: $showResult) {
            Alert(
                title: Text("Quiz Completed!"),
                message: Text("You scored \(score) out of \(questions.count)"),
                dismissButton: .default(Text("Try Again"), action: resetQuiz)
            )
        }
    }

    private func buttonBackground(for index: Int) -> Color {
        guard let selected = selectedAnswerIndex else { return .blue }
        if index == questions[currentQuestionIndex].correctAnswerIndex {
            return .green
        } else if index == selected {
            return .red
        } else {
            return .gray
        }
    }

    private func moveToNextQuestion() {
        if currentQuestionIndex + 1 < questions.count {
            currentQuestionIndex += 1
            selectedAnswerIndex = nil
            isAnswerSelected = false // Re-enable buttons for the next question
        } else {
            showResult = true
        }
    }

    private func resetQuiz() {
        currentQuestionIndex = 0
        selectedAnswerIndex = nil
        score = 0
        showResult = false
        isAnswerSelected = false // Reset answer selection state
    }
}


#Preview {
    FaithQuizView()
}
