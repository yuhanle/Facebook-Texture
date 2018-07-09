//
//  ViewController.swift
//  ClassTexture
//
//  Created by yuhanle on 2018/7/5.
//  Copyright © 2018年 yuhanle. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController {
    public var _mainTableNode: ASTableNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mainTableNode: ASTableNode = ASTableNode(style: .plain)
        mainTableNode.delegate = self
        mainTableNode.dataSource = self
        view.addSubnode(mainTableNode)
        
        mainTableNode.view.separatorStyle = .none
        mainTableNode.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        _mainTableNode = mainTableNode
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: ASTableDataSource, ASTableDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let haiTaoStyle = indexPath.row % 2 == 0 ? true: false
        
        let cellNodeBlock: ASCellNodeBlock = { () -> ASCellNode in
            let cellNode: TableViewNodeCell = TableViewNodeCell().initNodeCell(haitao: haiTaoStyle)
            return cellNode
        }
        
        return cellNodeBlock
    }
}
