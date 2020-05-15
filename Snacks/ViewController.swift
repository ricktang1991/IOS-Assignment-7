//
//  ViewController.swift
//  Snacks
//
//  Created by 桑染 on 2020-05-13.
//  Copyright © 2020 Rick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var snacks = [String]()
    
    @IBOutlet var navBarHeight: NSLayoutConstraint!
    
    @IBOutlet var plusButton: UIButton!
    
    @IBOutlet var navBar: UIView!
    
    var isActive = false
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    let titleLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "SNACKS"
        tl.font = UIFont.boldSystemFont(ofSize: 20)
        return tl
    }()
        
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navBar.addSubview(stackView)
        setupTableView()
        navBar.addSubview(titleLabel)
        
        titleLabel.centerYAnchor.constraint(equalTo: navBar.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: navBar.centerXAnchor).isActive = true
        
        let oreos = UIImageView()
        oreos.image = UIImage(named: "oreos")
        
        let pizzaPockets = UIImageView()
        pizzaPockets.image = UIImage(named: "pizza_pockets")
        
        let popTarts = UIImageView()
        popTarts.image = UIImage(named: "pop_tarts")
        
        let popsicle = UIImageView()
        popsicle.image = UIImage(named: "popsicle")
    
        let ramen = UIImageView()
        ramen.image = UIImage(named: "ramen")
        
        let oreosGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(oreosTapped(tapGestureRecognizer:)))
        oreos.isUserInteractionEnabled = true
        oreos.addGestureRecognizer(oreosGestureRecognizer)
        
        let pizzaPocketsGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pizzaPocketsTapped(tapGestureRecognizer:)))
        pizzaPockets.isUserInteractionEnabled = true
        pizzaPockets.addGestureRecognizer(pizzaPocketsGestureRecognizer)
        
        let popTartsGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(popTartsTapped(tapGestureRecognizer:)))
        popTarts.isUserInteractionEnabled = true
        popTarts.addGestureRecognizer(popTartsGestureRecognizer)
        
        let popsicleGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(popsicleTapped(tapGestureRecognizer:)))
        popsicle.isUserInteractionEnabled = true
        popsicle.addGestureRecognizer(popsicleGestureRecognizer)
        
        let ramenGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ramenTapped(tapGestureRecognizer:)))
        ramen.isUserInteractionEnabled = true
        ramen.addGestureRecognizer(ramenGestureRecognizer)
        
        stackView.addArrangedSubview(oreos)
        stackView.addArrangedSubview(pizzaPockets)
        stackView.addArrangedSubview(popTarts)
        stackView.addArrangedSubview(popsicle)
        stackView.addArrangedSubview(ramen)
        
        stackView.widthAnchor.constraint(equalTo: navBar.widthAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: navBar.topAnchor, constant: 100).isActive = true
        stackView.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -20).isActive = true
        stackView.isHidden = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        
    }
    
    @objc func oreosTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        snacks.append("Oreos")
        tableView.reloadData()
    }
    
    @objc func pizzaPocketsTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        snacks.append("Pizza Pockets")
        tableView.reloadData()
    }
    
    @objc func popTartsTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        snacks.append("Pop Tarts")
        tableView.reloadData()
    }
    
    @objc func popsicleTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        snacks.append("Popsicle")
        tableView.reloadData()
    }
    
    @objc func ramenTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        snacks.append("Ramen")
        tableView.reloadData()
    }

    @IBAction func plusIcon(_ sender: UIButton) {
        if isActive == true {
            titleLabel.text = "SNACKS"
            titleLabel.centerYAnchor.constraint(equalTo: navBar.centerYAnchor).isActive = true
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveLinear, animations: {
                self.navBarHeight.constant = 88
                self.plusButton.transform = .identity
                self.stackView.isHidden = true
                self.view.layoutIfNeeded()
            }, completion: { _ in self.isActive = false })
        } else {
            titleLabel.text = "Add a SNACK"
            titleLabel.centerYAnchor.constraint(equalTo: navBar.centerYAnchor, constant: -40).isActive = true
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveLinear, animations: {
                self.navBarHeight.constant = 200
                self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)/4)
                self.stackView.isHidden = false
                self.view.layoutIfNeeded()
            }, completion: { _ in self.isActive = true })
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SnackTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SnackTableViewCell
        cell.snacksLabel.text = snacks[indexPath.row]
        return cell
    }
}

