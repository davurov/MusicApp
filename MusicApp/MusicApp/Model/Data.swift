//
//  Data.swift
//  MusicApp
//
//  Created by Abduraxmon on 29/01/23.
//

import Foundation
struct Data {
    
    var songs = [Song]()
    
    mutating func apandMusic() {
        songs.append(Song(name: "1", albumName: "1", artistName: "2Pack", imageNmae: "song1", trackName: "song1"))
        songs.append(Song(name: "2", albumName: "2", artistName: "XS", imageNmae: "song2", trackName: "song2"))
        songs.append(Song(name: "3", albumName: "3", artistName: "DR DRE", imageNmae: "song3", trackName: "song3"))
        songs.append(Song(name: "1", albumName: "1", artistName: "2Pack", imageNmae: "song1", trackName: "song1"))
        songs.append(Song(name: "1", albumName: "1", artistName: "2Pack", imageNmae: "song1", trackName: "song1"))
        songs.append(Song(name: "2", albumName: "2", artistName: "XS", imageNmae: "song2", trackName: "song2"))
        songs.append(Song(name: "3", albumName: "3", artistName: "DR DRE", imageNmae: "song3", trackName: "song3"))
        songs.append(Song(name: "1", albumName: "1", artistName: "2Pack", imageNmae: "song1", trackName: "song1"))
    }
}
