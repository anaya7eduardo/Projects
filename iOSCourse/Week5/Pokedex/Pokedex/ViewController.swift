//
//  ViewController.swift
//  Pokedex
//
//  Created by Eduardo Anaya on 12/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -UIReferences
    @IBOutlet weak var tableView: UITableView!
    let cellID = "PokemonTableViewCell"
    var pokemons = [Pokemon]()
    var auxArray1 = [Pokemon]()
    var pokemonDetails = [PokemonSelected]()
    var auxArray2 = [PokemonSelected]()
    let semaphore = DispatchSemaphore(value: 0)
    var pokeURL: URL!
    var isPaginating = false
    
    //MARK: -ViewDidLoad
    override func viewDidLoad() {
        /*
         case abilities = "abilities"
         case height = "height"
         case id = "id"
         case moves = "moves"
         case name = "name"
         case sprites = "sprites"
         case types = "types"
         case weight = "weight"
         */
        pokemonDetails = Array(repeating:
            PokemonSelected(
                abilities: [Abilities(ability: Ability(name: "H1"))],
                height: -1,
                id: -1,
                moves: [Moves(move: Move(name: "M1"))],
                name: "N1",
                sprites: nil,
                types: [Types(typ: Typ(name: "T1"))],
                weight: -1),
            count: 150)
        fetchFirstData()
        setupDelegates()
        super.viewDidLoad()
        
    }

    //MARK: -SetupTableView
    func setupDelegates() {
        self.title = "POKÉDEX"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.view.backgroundColor = UIColor.red.withAlphaComponent(0.75)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
    }
    
    //MARK: -FetchData
    func fetchFirstData () {
        URLSession.shared.getRequest(url: APIEndpoints.pokedexAPI, decoding: Raw.self) {result in
            switch result {
            case .success(let data):
                self.pokemons.append(contentsOf: data.results)
                
                for (_, pokemon) in self.pokemons.enumerated() {
                    self.pokeURL = URL(string: pokemon.url)
                    URLSession.shared.getRequest(url: self.pokeURL, decoding: PokemonSelected.self) {result in
                        switch result {
                        case .success(let data):
                            self.pokemonDetails[data.id-1] = data
                            self.auxArray2.append(contentsOf: [data])
                            if self.auxArray2.count == 30 {
                                self.semaphore.signal()
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
                
                self.pokeURL = URL(string: data.next)
                DispatchQueue.main.async {
                    self.isPaginating = false
                    self.semaphore.wait()
                    self.auxArray2 = []
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    } //fetchFirstData
    
    //MARK: -FetchMoreData
    func fetchData() {
        //print("Fetch more data!")
            URLSession.shared.getRequest(url: self.pokeURL, decoding: Raw.self) {result in
                DispatchQueue.main.async {
                    self.tableView.tableFooterView = nil
                }
                switch result {
                case .success(let data):
                    self.pokemons.append(contentsOf: data.results)
                    self.auxArray1.append(contentsOf: data.results)
                    for (_, pokemon) in self.auxArray1.enumerated() {
                        self.pokeURL = URL(string: pokemon.url)
                        URLSession.shared.getRequest(url: self.pokeURL, decoding: PokemonSelected.self) {result in
                            switch result {
                            case .success(let data):
                                self.pokemonDetails[data.id-1] = data
                                self.auxArray2.append(contentsOf: [data])
                                if self.auxArray2.count == 30 {
                                    self.semaphore.signal()
                                }
                            case .failure(let error):
                                print(error)
                            }
                        }
                    }
                    
                    self.pokeURL = URL(string: data.next)
                    DispatchQueue.main.async {
                        self.isPaginating = false
                        self.semaphore.wait()
                        self.auxArray1 = []
                        self.auxArray2 = []
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    } //fetchData

}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard pokemonDetails[indexPath.row].id != -1, indexPath.row+1 == pokemonDetails[indexPath.row].id  else {
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = String(pokemonDetails[indexPath.row].id) + " " + pokemonDetails[indexPath.row].name
            return cell
        }
    
        if indexPath.row > 120 {
            self.isPaginating = true
        }
        
        lazy var myCell: PokemonTableViewCell = {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! PokemonTableViewCell
            let pokemon = pokemonDetails[indexPath.row]
            cell.setupCell(pokemon)
            return cell
        }()
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("\(pokemons[indexPath.row].url) Selected")
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.pokemonDetails = pokemonDetails[(tableView.indexPathForSelectedRow?.row)!]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func spinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        
        return footerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height-100-scrollView.frame.size.height) {
            guard !self.isPaginating else { return }
            fetchData()
            self.tableView.tableFooterView = spinnerFooter()
            self.isPaginating = true
        }
    }
    
}

