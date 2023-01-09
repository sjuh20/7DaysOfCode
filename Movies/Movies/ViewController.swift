//
//  ViewController.swift
//  Movies
//
//  Created by Ana Julia Brito de Souza on 09/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    let movies: [Movie] = [
        Movie(id: 1, title: "Órfã 2: A Origem", overview: "2022-07-27", release_date: nil, image: "", vote_average: 7.2),
        Movie(id: 2, title: "Minions 2: A Origem de Gru", overview: "2022-06-29", release_date: nil, image: "", vote_average: 7.8),
        Movie(id: 3, title: "Thor: Amor e Trovão", overview: "2022-07-06", release_date: nil, image: "", vote_average: 6.8),
        Movie(id: 4, title: "Avatar", overview: "2009-12-18", release_date: nil, image: nil, vote_average: 8.8),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Gradient1")
        addConstraints()
        configTableView()
        gradientView()
    }
    
    func gradientView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(named: "Gradient1")?.cgColor, UIColor(named: "Gradient2")?.cgColor]
            view.layer.addSublayer(gradientLayer)
        
        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.addSublayer(gradientLayer)
        tableView.backgroundView = backgroundView
    }
    
        lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Filmes Populares"
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return title
    }()
    
        private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        return tableView
        }()
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func addConstraints() {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let movies = movies[indexPath.row]
        
        cell.textLabel?.text = movies.title
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        
        return cell
        
    }
    
    
}

