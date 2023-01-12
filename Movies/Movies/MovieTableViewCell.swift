//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Ana Julia Brito de Souza on 10/01/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier: String = "MovieTableViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var titleReleaseDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white.withAlphaComponent(0.75)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var titleVoteAverage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white.withAlphaComponent(0.75)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var imagePoster: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 18.0
        image.layer.masksToBounds = true
        image.backgroundColor = .red
        return image
    }()
    
    private lazy var stackViewLabels: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 16.0
        return stack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addConstraints()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(from url: String, imageView: UIImageView) {
        guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(url)") else {return}
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else {return}
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
    }
    
    func configureData(movie: Movie) {
        titleLabel.text = movie.title
        titleReleaseDate.text = "Lançamento: \(movie.release_date)"
        titleVoteAverage.text = "\(movie.vote_average)"
        setImage(from: movie.poster_path ?? "", imageView: imagePoster)
    }
    
    private func setLayout() {
        backgroundColor = .clear
    }
    
    private func addConstraints() {
        self.addSubview(mainStackView)
        self.mainStackView.addArrangedSubview(imagePoster)
        self.mainStackView.addArrangedSubview(stackViewLabels)
        self.stackViewLabels.addArrangedSubview(titleLabel)
        self.stackViewLabels.addArrangedSubview(titleReleaseDate)
        self.stackViewLabels.addArrangedSubview(titleVoteAverage)
        
        
        
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0),
            
            imagePoster.widthAnchor.constraint(equalToConstant: 90),
            imagePoster.heightAnchor.constraint(equalToConstant: 120),
            
        ])
    }
    
}
