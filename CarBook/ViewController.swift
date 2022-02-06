//
//  ViewController.swift
//  CarBook
//
//  Created by Hasan Atık on 5.02.2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var Secilenisim = " "
    var Secilengorsel = " "
    var arabaDizisi = [Cars]()
    var KullaniciSecim : Cars?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let maserati = Cars(Aracismi: "Maserati", Aracresmi: UIImage(named: "maserati")!)
        let subra = Cars(Aracismi: "Subra", Aracresmi: UIImage(named: "subra")!)
        let bmw = Cars(Aracismi: "BMW", Aracresmi: UIImage(named: "bmw")!)
        let porsche = Cars(Aracismi: "Porsche", Aracresmi: UIImage(named: "porsche")!)
        let mustang = Cars(Aracismi: "Mustang", Aracresmi: UIImage(named: "mustang")!)
        
        arabaDizisi = [maserati,subra,bmw,porsche,mustang]
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
      let cell = UITableViewCell()
        cell.textLabel?.text = arabaDizisi[indexPath.row].Aracismi
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arabaDizisi.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete
        {
            arabaDizisi.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        KullaniciSecim = arabaDizisi[indexPath.row]
    
        performSegue(withIdentifier: "toDetayVc", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetayVc"
        {
            let DestionationVC = segue.destination as! DetayViewController
            DestionationVC.SecilenArac = KullaniciSecim

        }
    }
    
}

