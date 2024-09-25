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
    @Binding var selectedIndex: Int // Controle da navegação
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false // Controle de login

    public var body: some View {
        VStack {
            if currentStep == 0 {
                FullNameStepView(fullName: $fullName, nextAction: goToNextStep, selectedIndex: $selectedIndex)
            } else if currentStep == 1 {
                EmailStepView(email: $email, confirmEmail: $confirmEmail, nextAction: goToNextStep, previousAction: goToPreviousStep)
            } else if currentStep == 2 {
                PasswordStepView(password: $password, confirmPassword: $confirmPassword, nextAction: goToNextStep, previousAction: goToPreviousStep)
            } else {
                FinalStepView(selectedIndex: $selectedIndex)
            }
        }
    }
    
    // Funções para avançar ou voltar entre etapas
    private func goToNextStep() {
        if currentStep < 3 {
            currentStep += 1
        } else {
            // Após o registro, definir como logado
            isLoggedIn = true
            selectedIndex = 0 // Navegar de volta ao MainView
        }
    }
    
    private func goToPreviousStep() {
        if currentStep > 0 {
            currentStep -= 1
        }
    }
}
