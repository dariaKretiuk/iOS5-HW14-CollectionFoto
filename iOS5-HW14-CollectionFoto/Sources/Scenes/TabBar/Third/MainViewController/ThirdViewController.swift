//
//  ThirdViewController.swift
//  iOS5-HW14-CollectionFoto
//
//  Created by Дарья Кретюк on 26.03.2022.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Elements
    
    lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: viewLayout)
        return collectionView
    }()
    
    lazy var bottomLine: CALayer = {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: -3, width: view.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.f5cac5.cgColor
        return bottomLine
    }()
    
    private var models: [Section] = Section.getSections()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayouts()
        setupCollection()
        collectionView.reloadData()
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func setupCollection() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SectionOneCollectionViewCell.self, forCellWithReuseIdentifier: SectionOneCollectionViewCell.identifier)
        collectionView.register(SectionSecondCollectionViewCell.self, forCellWithReuseIdentifier: SectionSecondCollectionViewCell.identifier)
        collectionView.register(SectionFhirdCollectionViewCell.self, forCellWithReuseIdentifier: SectionFhirdCollectionViewCell.identifier)
        collectionView.register(SectionFourthCollectionViewCell.self, forCellWithReuseIdentifier: SectionFourthCollectionViewCell.identifier)
        collectionView.register(SectionFifthCollectionViewCell.self, forCellWithReuseIdentifier: SectionFifthCollectionViewCell.identifier)
        collectionView.register(AlbumsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // MARK: - CompositionalLayout
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in

            guard let sectionKind = Metric(rawValue: sectionNumber) else { return nil }
            var section: NSCollectionLayoutSection
            var nestedGroup: NSCollectionLayoutGroup
            let (columns, widthDimensionItem, heightDimensionGroup, bottomItem, bottomSection) = sectionKind.columnCountHeight()
            // item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(widthDimensionItem))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 0, leading: 0, bottom: bottomItem, trailing: 15)
            // group - vertical
            let innerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.50), heightDimension: .fractionalHeight(1.0))
            let innerGroup = NSCollectionLayoutGroup.vertical(layoutSize: innerGroupSize, subitem: item, count: columns)

            if [0, 1, 2].contains(sectionNumber) {
                // group - horizontal
                let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.90), heightDimension: .fractionalHeight(heightDimensionGroup))
                nestedGroup = NSCollectionLayoutGroup.horizontal(layoutSize: nestedGroupSize, subitems: [innerGroup])
            } else {
                let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(heightDimensionGroup))
                nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: nestedGroupSize, subitems: [item])
            }
            section = NSCollectionLayoutSection(group: nestedGroup)
            section.contentInsets = .init(top: 0, leading: 18, bottom: bottomSection, trailing: 0)
            section.orthogonalScrollingBehavior = .groupPaging
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [header]
            return section
        }
    }
    
    // MARK: - Data Source and Delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .myAlbumCell(let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionOneCollectionViewCell.identifier, for: indexPath) as? SectionOneCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: model)
            return cell
        case .commonAlbumCell(let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionSecondCollectionViewCell.identifier, for: indexPath) as? SectionSecondCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: model)
            return cell
        case .peoplePlaceCell(let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionFhirdCollectionViewCell.identifier, for: indexPath) as? SectionFhirdCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: model)
            return cell
        case .typeMediaCell(let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionFourthCollectionViewCell.identifier, for: indexPath) as? SectionFourthCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: model)
            return cell
        case .othersCell(let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionFifthCollectionViewCell.identifier, for: indexPath) as? SectionFifthCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let model = models[indexPath.section]
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as? AlbumsHeaderView else {
            return UICollectionReusableView()
        }
        header.layer.addSublayer(bottomLine)
        header.configure(with: model)
        
        return header
    }
    
    // MARK: - Actions
    @objc func addTapped() {
        print("""
            Добавить:
        - Новый альбом
        - Новую папку
        - Новый общие альбом
        """)
    }
}
