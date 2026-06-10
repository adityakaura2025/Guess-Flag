//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Aditya Kaura on 29/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var Countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    var body: some View{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            VStack(spacing: 70){
                Text("Guess The Flag")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                
                VStack(spacing: 15){
                    
                    VStack{
                        Text("Tap The Flag OF")
                            .foregroundStyle(.secondary)
                            .foregroundColor(.black)
                            .font(.largeTitle)
                        Text(Countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagtapped(number: number)
                        }
                        label: {
                            Image(Countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    func flagtapped(number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
            score += 1
        }
        else {
            scoreTitle = "Pagal"
            score -= 1
        }
        showingScore = true
    }
        func askQuestion(){
            Countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            
        }}

    #Preview {
        ContentView()
    }
