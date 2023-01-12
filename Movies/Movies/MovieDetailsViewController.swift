//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Ana Julia Brito de Souza on 12/01/23.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private var movie: Movie
    
    private lazy var titleDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 28.0, weight: .bold)
        return label
    }()
    
    private lazy var imagePoster: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 32.0
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var titleVoteAverage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "Classificação dos usuários: \(movie.vote_average)"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var labelOverview: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = movie.overview
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = .white.withAlphaComponent(0.75)
        var paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 0.8
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.gradientView()
        setLayout()
        setImage(from: movie.poster_path ?? "", imageView: imagePoster)
    }
    
    private func setLayout() {
        navigationController?.navigationBar.tintColor = UIColor.white
        view.addSubview(titleDetailLabel)
        view.addSubview(imagePoster)
        view.addSubview(titleVoteAverage)
        view.addSubview(labelOverview)
        
        NSLayoutConstraint.activate([
            
            titleDetailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
            titleDetailLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleDetailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            imagePoster.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePoster.widthAnchor.constraint(equalToConstant: 192.0),
            imagePoster.heightAnchor.constraint(equalToConstant: 264.0),
            imagePoster.topAnchor.constraint(equalTo: titleDetailLabel.bottomAnchor, constant: 32.0),
            
            titleVoteAverage.topAnchor.constraint(equalTo: imagePoster.bottomAnchor, constant: 32.0),
            titleVoteAverage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleVoteAverage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            labelOverview.topAnchor.constraint(equalTo: titleVoteAverage.bottomAnchor, constant: 32.0),
            labelOverview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -27),
            labelOverview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 27),
        ])
    }

    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieDetailsViewController {
    
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
}
