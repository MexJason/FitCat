//
//  HomeView.swift
//  FitCat
//
//  Created by Jason Dubon on 9/3/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager: HealthManager
    let welcomeArray = ["Welcome", "Bienvenido", "Bienvenue"]
    @State private var currentIndex = 0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text(welcomeArray[currentIndex])
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.secondary)
                    .animation(.easeInOut(duration: 1), value: currentIndex)
                    .onAppear {
                        startWelcomeTimer()
                    }
                
                HStack {
                    Spacer()
                    
                    VStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Calories")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.red)
                            
                            Text("\(manager.calories) kcal")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Active")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.green)
                            
                            Text("\(manager.exercise) mins")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Stand")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.blue)
                            
                            Text("\(manager.stand) hours")
                                .bold()
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        ProgressCircle(progress: $manager.calories, goal: 1000, color: .red)
                            .frame(width: 200, height: 200)
                        
                        ProgressCircle(progress: $manager.exercise, goal: 60, color: .green)
                            .frame(width: 160, height: 160)
                        
                        ProgressCircle(progress: $manager.stand, goal: 12, color: .blue)
                            .frame(width: 120, height: 120)
                    }
                    Spacer()
                }
                .padding(.vertical)
                
                HStack {
                    Text("Fitness Activity")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Show more")
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(20)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                    ForEach(manager.mockActivities.prefix(4)) { activity in
                        ActivityCard(activity: activity)
                        
                    }
                }
                .padding(.horizontal)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
    
    func startWelcomeTimer() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % welcomeArray.count
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HealthManager())
    }
}
