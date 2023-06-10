//
//  ViewController.swift
//  Movies
//
//  Created by Eduardo Anaya on 12/1/21.
//  API : https://api.themoviedb.org/3/movie/550?api_key=beeded903c11a1712a480807d1de2d8d
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        setupTableView()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

     func setupTableView() {
         fetchJSON() {
             self.tableview.reloadData()
         }
         tableview.delegate = self
         tableview.dataSource = self
     }
     
     func fetchJSON(completed: @escaping ()->()) {
         guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=beeded903c11a1712a480807d1de2d8d&language=en-US&page=1") else { return }
         let session = URLSession.shared
         
         let task =  session.dataTask(with: url) { data, response, error in
             guard error == nil else {
                 print("Error: \(error?.localizedDescription ?? "Something Happened Here")")
                 return
             }
             
             guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                 print("Server Error")
                 return
             }
             
             guard data != nil else {
                 print("Error: We Have No Data Bub")
                 return
             }
             
             do {
                 //Instead Of First Serializing The JSON With JSONSerialization Class Or Associated Functions We Can Instead Let The Instance Of Our Array Of Heroes Hold The Decoded Data Directly
                 let JSONData = try JSONDecoder().decode(Root.self, from: data!)
                 self.movies = JSONData.results
                 DispatchQueue.main.async {
                     //Here We Call The Closure To Indicate This Is Where The Results Of The Fetch Should Be Used
                     completed()
                 }
             } catch {
                 print("Error: \(error.localizedDescription)")
             }

         }
         task.resume()
     }
     
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = movies[indexPath.row].title.capitalized
        cell.detailTextLabel?.text = "Rating: " + String(movies[indexPath.row].voteAverage)
        return cell
    }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.movie = movies[(tableview.indexPathForSelectedRow?.row)!]
        }
    }
}

/*
 You will be getting the top rated movies and returning them in a tableview that displays:
 1. The name of the Film
 2. The rating of the movie

 When I select a given film from any row I am taken to a details screen. On this details screen we have three things:

 1. A large image of the film
 2. A label displaying the year the movie was released/made
 3. A description of the movie

 Your main ViewController should be embedded in a Navigation controller. You may also add a button to dismiss the detail screen. Font should be large and readable.
 */

/*
 MARK: -Example Data
 {
   "adult": false,
   "backdrop_path": "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg",
   "belongs_to_collection": null,
   "budget": 63000000,
   "genres": [
     {
       "id": 18,
       "name": "Drama"
     }
   ],
   "homepage": "http://www.foxmovies.com/movies/fight-club",
   "id": 550,
   "imdb_id": "tt0137523",
   "original_language": "en",
   "original_title": "Fight Club",
   "overview": "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
   "popularity": 48.515,
   "poster_path": "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
   "production_companies": [
     {
       "id": 508,
       "logo_path": "/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png",
       "name": "Regency Enterprises",
       "origin_country": "US"
     },
     {
       "id": 711,
       "logo_path": "/tEiIH5QesdheJmDAqQwvtN60727.png",
       "name": "Fox 2000 Pictures",
       "origin_country": "US"
     },
     {
       "id": 20555,
       "logo_path": "/hD8yEGUBlHOcfHYbujp71vD8gZp.png",
       "name": "Taurus Film",
       "origin_country": "DE"
     },
     {
       "id": 54051,
       "logo_path": null,
       "name": "Atman Entertainment",
       "origin_country": ""
     },
     {
       "id": 54052,
       "logo_path": null,
       "name": "Knickerbocker Films",
       "origin_country": "US"
     },
     {
       "id": 25,
       "logo_path": "/qZCc1lty5FzX30aOCVRBLzaVmcp.png",
       "name": "20th Century Fox",
       "origin_country": "US"
     },
     {
       "id": 4700,
       "logo_path": "/A32wmjrs9Psf4zw0uaixF0GXfxq.png",
       "name": "The Linson Company",
       "origin_country": "US"
     }
   ],
   "production_countries": [
     {
       "iso_3166_1": "DE",
       "name": "Germany"
     },
     {
       "iso_3166_1": "US",
       "name": "United States of America"
     }
   ],
   "release_date": "1999-10-15",
   "revenue": 100853753,
   "runtime": 139,
   "spoken_languages": [
     {
       "english_name": "English",
       "iso_639_1": "en",
       "name": "English"
     }
   ],
   "status": "Released",
   "tagline": "Mischief. Mayhem. Soap.",
   "title": "Fight Club",
   "video": false,
   "vote_average": 8.4,
   "vote_count": 22934
 }
 */

/*
 MARK: -Needed Info
 {
   "backdrop_path": "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg",
   "genres": [
     {
       "id": 18,
       "name": "Drama"
     }
   ],
   "original_title": "Fight Club",
   "overview": "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
   "poster_path": "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
   "release_date": "1999-10-15",
   "title": "Fight Club",
   "vote_average": 8.4,
}
 */
