//
//  AlbumVC.swift
//  MusicApp
//
//  Created by Abduraxmon on 29/01/23.
//

import UIKit

class AlbumVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Music"
        
        setUpTAbleView() 
        data.apandMusic()
    }
    
    func setUpTAbleView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension AlbumVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let song = data.songs[indexPath.row]
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.imageView?.image = UIImage(named: song.imageNmae)
        
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        //Present Player
        let vc2 = MusicVC(nibName: "MusicVC", bundle: nil)
        vc2.position = position
        vc2.songs = data.songs
        present(vc2, animated: true)
    }
    
}
