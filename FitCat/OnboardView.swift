//
//  OnboardView.swift
//  FitCat
//
//  Created by Jason Dubon on 9/3/23.
//

import SwiftUI

struct OnboardView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    var body: some View {
        
        VStack {
            Text("Onboarding 😃")
                
                .font(.largeTitle)
            
            Button {
                isOnboarding = false
            } label: {
                Text("Done")
                    .padding()
                    .foregroundColor(.white)
                    .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                    )
            }
        }
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
