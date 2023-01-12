//
//  ViewController.swift
//  Movies
//
//  Created by Ana Julia Brito de Souza on 09/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    var networking = Networking()
    var movies = [Movie]()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Filmes Populares"
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return title
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.gradientView()
        addConstraints()
        configTableView()
        configureApi()
    }
    
    func configureApi() {
        self.networking.fetchMovies { [weak self] movies in
            self?.movies = movies
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func addConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell {
            cell.selectionStyle = .none
            cell.configureData(movie: movies[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}

