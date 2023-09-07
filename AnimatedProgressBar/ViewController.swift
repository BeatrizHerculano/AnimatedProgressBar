//
//  ViewController.swift
//  AnimatedProgressBar
//
//  Created by Beatriz Herculano on 22/08/23.
//

import UIKit

class ViewController: UIViewController {
    let contentView = AnimatedProgressBarView(totalTasks: 10)
    let completedTasks = 7
    
    override func viewDidLoad() {
        view = contentView
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.configureProgressBar(completedTasks: completedTasks)
    }

}

