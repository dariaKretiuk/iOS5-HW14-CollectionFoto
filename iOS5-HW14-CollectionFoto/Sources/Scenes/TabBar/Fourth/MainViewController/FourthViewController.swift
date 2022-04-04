//
//  FourthViewController.swift
//  iOS5-HW14-CollectionFoto
//
//  Created by Дарья Кретюк on 26.03.2022.
//

import UIKit

class FourthViewController: UIViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private func
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = "Поиск"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
