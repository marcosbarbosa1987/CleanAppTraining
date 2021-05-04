//
//  AlertViewSpy.swift
//  PresentationTests
//
//  Created by Marcos Barbosa on 04/05/21.
//

import Foundation
import Presentation

class AlertViewSpy: AlertView {
    var emit: ((AlertViewModel) -> Void)?
    
    func observe(completion: @escaping(AlertViewModel) -> Void) {
        self.emit = completion
    }

    func showMessage(viewModel: AlertViewModel) {
        self.emit?(viewModel)
    }
}
