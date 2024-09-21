//
//  SigninView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

public struct StepperView: View {
    @State private var currentStep: Int = 0
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var confirmEmail: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    public var body: some View {
        VStack {
            if currentStep == 0 {
                FullNameStepView(fullName: $fullName, nextAction: goToNextStep, previousAction: goToPreviousStep)
            } else if currentStep == 1 {
                EmailStepView(email: $email, confirmEmail: $confirmEmail, nextAction: goToNextStep, previousAction: goToPreviousStep)
            } else if currentStep == 2 {
                PasswordStepView(password: $password, confirmPassword: $confirmPassword, nextAction: goToNextStep, previousAction: goToPreviousStep)
            } else {
                FinalStepView(previousAction: goToPreviousStep)
            }
        }
    }
    
    // Funções para avançar ou voltar entre etapas
    private func goToNextStep() {
        if currentStep < 3 {
            currentStep += 1
        }
    }
    
    private func goToPreviousStep() {
        if currentStep > 0 {
            currentStep -= 1
        }
    }
}

#Preview {
    StepperView()
}
