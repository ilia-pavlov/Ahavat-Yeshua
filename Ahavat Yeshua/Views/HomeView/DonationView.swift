//
//  DonationView.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/20/23.
//

import SwiftUI

struct DonationView: View {
    @State private var quantity: Int = 0
    @State private var totalAmount: Double = 0
    @State private var showCongratulations: Bool = false
    
    var body: some View {
        VStack {
            Text("Total Amount: $\(totalAmount, specifier: "%.2f")")
                .font(.headline)
            
            HStack {
                Button(action: {
                    self.totalAmount += 1.0
                }) {
                    Text("$1")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    self.totalAmount += 5.0
                }) {
                    Text("$5")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
            }
            
            Stepper(value: $quantity, in: 0...10) {
                Text("Quantity: \(quantity)")
            }
            .padding()
            
            Text("Total: $\(totalAmount * Double(quantity), specifier: "%.2f")")
                .font(.headline)
            
            Button(action: {
                // Handle the donation action here
                // For example, you can show an alert or navigate to a donation screen.
                self.showCongratulations.toggle()
            }) {
                Text("Donate")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .sheet(isPresented: $showCongratulations, content: {
            CongratulationsView(isPresented: $showCongratulations)
        })
        
    }
}

struct CongratulationsView: View {
    @Binding var isPresented: Bool
    @State private var fireworksVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("Congratulations!")
                .font(.title)
                .fontWeight(.bold)
            
            if fireworksVisible {
                FireworksView()
            }
            
            Button(action: {
                withAnimation {
                    // Show fireworks when the "Close" button is tapped
                    fireworksVisible.toggle()
                }
                
                // Close the congratulations popup after a delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isPresented = false
                }
            }) {
                Text("Thank you!")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .onAppear {
            // Automatically show fireworks when the view appears
            withAnimation {
                fireworksVisible.toggle()
            }
        }
    }
}


import SwiftUI

struct FireworksView: View {
    @State private var particles: [Particle] = []

    var body: some View {
        ZStack {
            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: 8, height: 8)
                    .position(particle.position)
                    .opacity(particle.opacity)
                    .scaleEffect(particle.scale)
                    .animation(.easeOut(duration: 5), value: particle)
            }
        }
        .onAppear {
            launchConfetti()
        }
    }

    func launchConfetti() {
        particles = (0..<40).map { _ in
            Particle(
                id: UUID(),
                position: CGPoint(
                    x: UIScreen.main.bounds.width / 2,
                    y: UIScreen.main.bounds.height / 2
                ),
                color: Color.random(),
                opacity: Double.random(in: 0.7...1),
                scale: CGFloat.random(in: 0.5...1.2)
            )
        }

        // Simulate motion
        for i in particles.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                withAnimation {
                    particles[i].position.x += CGFloat.random(in: -150...150)
                    particles[i].position.y += CGFloat.random(in: -300...0)
                    particles[i].opacity = 0
                }
            }
        }
    }
}

struct Particle: Identifiable, Equatable {
    let id: UUID
    var position: CGPoint
    let color: Color
    var opacity: Double
    let scale: CGFloat
}


extension Color {
    static func random() -> Color {
        let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange, .pink]
        return colors.randomElement() ?? .white
    }
}


#Preview {
    DonationView()
}
