//
//  UserTableViewController.swift
//  APIReqRes
//
//  Created by user216592 on 4/7/22.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    var user : [UserModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Usuarios")
        
        if let url = URL(string: "https://reqres.in/api/users"){
            
            let tarefa = URLSession.shared.dataTask(with: url){
                (dados, requisicao, erro) in
                                           
                    if erro == nil {
                        print("Dados capturados da API com sucesso")
                        
                        //print(dados)
                        
                        let decoder = JSONDecoder()
                        if let retorno = dados{
                            do {
                                let users  = try decoder.decode(UserPages.self, from: retorno)
                                for separador in users.data {
                                    self.user.append(separador)
                                }
                                self.tableView.reloadData()
                                
                            }
                            catch {
                                print("Erro ao converter User Model")
                            }
                        }
                    }else{
                        print("Erro ao consultar a API")
                    }
            }
            tarefa.resume()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return user.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)

        cell.textLabel?.text = self.user[indexPath.row].first_name
        
        return cell
    }
}
