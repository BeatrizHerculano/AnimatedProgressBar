//
//  AnimatedProgressBarView.swift
//  AnimatedProgressBar
//
//  Created by Beatriz Herculano on 31/08/23.
//

import Foundation
import UIKit


class AnimatedProgressBarView: UIView {
    
    var totalTasks = 0
    
    private lazy var completedFromTotal: UILabel = {
        let label = UILabel()
        label.text = "0 out 0 tasks completed"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var card: UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .white
        card.layer.cornerRadius = 10
        return card
    }()
    
    private lazy var cardStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 5
        return stack
    }()
    
    private lazy var progressBarContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emptyProgressBar: UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .systemGray4
        card.layer.cornerRadius = 5
        return card
    }()
    
    private lazy var progressBar: UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .systemPink
        card.layer.cornerRadius = 5
        return card
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right")?.withTintColor(.systemPink), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    init(totalTasks: Int){
        super.init(frame: .zero)
        backgroundColor = .systemGray4
        self.totalTasks = totalTasks
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureProgressBar(completedTasks: Int){
        cardStack.layoutSubviews()
        progressBarContainer.layoutSubviews()
        button.layoutSubviews()
        
        let percentageWidth = emptyProgressBar.frame.width * 0.7
        
        self.progressBar.widthAnchor.constraint(equalToConstant: percentageWidth).isActive = true
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseIn) { [self] in
            self.layoutIfNeeded()
        }
    }
    
    func setup(){
        setupViewHierarchy()
        setupConstraints()
    }
    
    func setupViewHierarchy(){
        addSubview(card)
        progressBarContainer.addSubview(completedFromTotal)
        progressBarContainer.addSubview(emptyProgressBar)
        progressBarContainer.addSubview(progressBar)
        cardStack.addArrangedSubview(progressBarContainer)
        cardStack.addArrangedSubview(button)
        card.addSubview(cardStack)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: centerYAnchor),
            card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            card.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            card.heightAnchor.constraint(equalToConstant: 100),
            
            cardStack.topAnchor.constraint(equalTo: card.topAnchor),
            cardStack.bottomAnchor.constraint(equalTo: card.bottomAnchor),
            cardStack.leadingAnchor.constraint(equalTo: card.leadingAnchor),
            cardStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            
            completedFromTotal.topAnchor.constraint(equalTo: progressBarContainer.topAnchor, constant: 20),
            completedFromTotal.leadingAnchor.constraint(equalTo: progressBarContainer.leadingAnchor, constant: 20),
            
            emptyProgressBar.topAnchor.constraint(equalTo: completedFromTotal.bottomAnchor, constant: 20),
            emptyProgressBar.leadingAnchor.constraint(equalTo: progressBarContainer.leadingAnchor, constant: 20),
            emptyProgressBar.trailingAnchor.constraint(equalTo: progressBarContainer.trailingAnchor, constant: -20),
            emptyProgressBar.heightAnchor.constraint(equalToConstant: 10),
            
            progressBar.topAnchor.constraint(equalTo: emptyProgressBar.topAnchor),
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            progressBar.leadingAnchor.constraint(equalTo: emptyProgressBar.leadingAnchor)
        ])
        
        
         
    }
    
    
}
