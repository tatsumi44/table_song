//
//  ViewController.swift
//  Swift4tableView_song
//
//  Created by tatsumi kentaro on 2018/02/04.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var song_array = [String]()
    
    var song_name_array = [String]()
    
    var image_name_array = [String]()
    
    var audioplayer: AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        song_array = ["エリーゼのために！","キャノン"," HEY!HEY!HEY!"]
        song_name_array = ["cannon","elise"," alia"]
        image_name_array = ["Beethoven.jpg","Pachelbel.jpg","Bach.jpg"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの個数設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return song_array.count
        
    }
    //セルの内容設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        
        cell?.textLabel?.text = song_array[indexPath.row]
        cell?.imageView?.image = UIImage(named:image_name_array[indexPath.row])
        
        return cell!
    }
    //セルが押された時に呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: song_name_array[indexPath.row], ofType: "mp3")!)
        print(audioPath)
        //再生の準備
        audioplayer = try? AVAudioPlayer(contentsOf: audioPath)
    
        //再生
        audioplayer.play()
        print("\(song_array[indexPath.row])選ばれたばれたんご")
        
    }


}

