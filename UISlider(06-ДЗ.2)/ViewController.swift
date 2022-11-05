//
//  ViewController.swift
//  UISlider(06-ДЗ.2)
//
//  Created by ILYA POPOV on 28.10.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var musics: [Music] = []
    
    struct Cells {
        static let musicCell = "TableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My playlist"
        musics = fetchData()
        configureTableView()
        setTableViewDelegate()
    }
    //MARK: - tableView
    func configureTableView() {
        view.addSubview(tableView)
        //высота ряда
        tableView.rowHeight = 80
        //Настройка высоты
        tableView.pin(to: view)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: Cells.musicCell)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
//MARK: - Delegate, DataSourse
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.musicCell) as! TableViewCell
        let music = musics[indexPath.row]
        cell.set(music: music)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = MusicController()
        detailVC.music = musics[indexPath.row]
        present(detailVC, animated: true)
        print("Test")
    }
}

//MARK: - Отображение строк таблицы
extension ViewController {
    public func fetchData() -> [Music] {
        let music1 = Music(image: UIImage(named: "1")!, name: "The Limba", artist: "Секрет", time: "", play: "Limba" )
        let music2 = Music(image: UIImage(named: "2")!, name: "Loqiemean", artist: "Хороший мальчик", time: "", play: "Loqiemean" )
        let music3 = Music(image: UIImage(named: "3")!, name: "MORGENSHTERN, Boombl4, The Limba & NILETTO", artist: "Сколько стоит любовь", time: "", play: "morgen")
        return [music1, music2, music3]
    }
}

