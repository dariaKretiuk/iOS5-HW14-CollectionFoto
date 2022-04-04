//
//  AlbumCollectionViewCell.swift
//  iOS5-HW14-CollectionFoto
//
//  Created by Дарья Кретюк on 03.04.2022.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    static let identifier = "AlbumCollectionViewCell"
    
    private let albumImageViewContainer: UIView = {
       let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    let albumImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        return img
    }()
    
    var nameAlbum:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var countFoto: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(albumImageView)
        stackView.addArrangedSubview(nameAlbum)
        stackView.addArrangedSubview(countFoto)
        
        NSLayoutConstraint.activate([
            albumImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            albumImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            albumImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            albumImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            albumImageView.heightAnchor.constraint(equalToConstant: 206),
            albumImageView.widthAnchor.constraint(equalToConstant: 206)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumImageView.image = nil
        nameAlbum.text = nil
        countFoto.text = nil
        stackView.backgroundColor = nil
    }
    
    // MARK: - Private functions
    
    public func configure(with model: FotoMYAlbum) {
        nameAlbum.text = model.title
        albumImageView.image = model.icon
        countFoto.text = model.countFoto
    }
}

