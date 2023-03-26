//
//  QuestionsVM.swift
//  BaseApp
//
//  Created by Shirin on 3/26/23.
//

import Foundation

class QuestionsVM {
    
    var questions: Binder<[Faq]> = Binder([])
    
    var inProgress: Binder<Bool> = Binder(false)
    
    func getData(){
        inProgress.value = true
        
        Requests.getFaq { [weak self] resp in
            self?.inProgress.value = false

            self?.questions.value = resp?.results ?? []
        }
    }
}
