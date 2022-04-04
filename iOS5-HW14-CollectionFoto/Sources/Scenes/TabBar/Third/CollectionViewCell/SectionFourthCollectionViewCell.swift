//
//  SectionFourthCollectionViewCell.swift
//  iOS5-HW14-CollectionFoto
//
//  Created by Дарья Кретюк on 01.04.2022.
//

import UIKit

class SectionFourthCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Elements
    
    static let identifier = "SectionFourthCollectionViewCell"
    
    private let bottomLine: CALayer = {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 0, width: 700, height: 2)
        bottomLine.backgroundColor = UIColor(red: 247.0/255.0,
                                             green: 247.0/255.0,
                                             blue: 247.0/255.0,
                                             alpha: 1
        ).cgColor
        return bottomLine
    }()
    
    public let iconImageViewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let iconImageViewCategory: UIImageView = {
        let img = UIImageView()
        img.contentMode = .left
        img.contentMode = .scaleAspectFit
        img.tintColor = .systemBlue
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let nameCategory: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countFoto: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .systemGray
        label.contentMode = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let iconArrowContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let iconArrow: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "chevron.right")
        img.contentMode = .right
        img.contentMode = .scaleAspectFit
        img.tintColor = .gray
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayouts()
        
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Private functions
    
    private func setupHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(iconImageViewContainer)
        iconImageViewContainer.addSubview(iconImageViewCategory)
        stackView.addArrangedSubview(nameCategory)
        stackView.addArrangedSubview(countFoto)
        stackView.addArrangedSubview(iconArrowContainer)
        iconArrowContainer.addSubview(iconArrow)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            
            iconImageViewContainer.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            iconImageViewContainer.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            iconImageViewContainer.widthAnchor.constraint(equalToConstant: 45),
            iconImageViewContainer.heightAnchor.constraint(equalToConstant: 45),
            
            iconImageViewCategory.centerYAnchor.constraint(equalTo: iconImageViewContainer.centerYAnchor),
            iconImageViewCategory.heightAnchor.constraint(equalToConstant: 35),
            iconImageViewCategory.widthAnchor.constraint(equalToConstant: 35),
            
            nameCategory.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            nameCategory.leadingAnchor.constraint(equalTo: iconImageViewCategory.trailingAnchor, constant: 10),
            nameCategory.trailingAnchor.constraint(equalTo: countFoto.leadingAnchor),
            
            iconArrowContainer.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            iconArrowContainer.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            iconArrowContainer.widthAnchor.constraint(equalToConstant: 20),
            iconArrowContainer.heightAnchor.constraint(equalToConstant: 20),

            iconArrow.centerYAnchor.constraint(equalTo: iconArrowContainer.centerYAnchor),
            iconArrow.trailingAnchor.constraint(equalTo: iconArrowContainer.trailingAnchor, constant: -10),
            iconArrow.widthAnchor.constraint(equalToConstant: 20),
            iconArrow.heightAnchor.constraint(equalToConstant: 20),
            
            countFoto.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            countFoto.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -30)
        ])
    }

    // MARK: - Configure cell
    
    func configure(with model: FotoTypeMedia) {
        nameCategory.text = model.title
        iconImageViewCategory.image = model.icon
        countFoto.text = model.countFoto
        
        if model.title != "Видео" {
            contentView.layer.addSublayer(bottomLine)
        }
    }
}
