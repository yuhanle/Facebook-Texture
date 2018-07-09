//
//  TableViewNodeCell.swift
//  ClassTexture
//
//  Created by yuhanle on 2018/7/6.
//  Copyright © 2018年 yuhanle. All rights reserved.
//

import AsyncDisplayKit

func FONT_PingFangSC_Light(s: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: s)
}

class TableViewNodeCell: ASCellNode {
    var _titleNode: ASTextNode!                 //标题
    var _goodsImageNode: ASNetworkImageNode!    //商品图片
    var _goodsTypeTagNode: ASImageNode!         //商品类别标签
    var _goodsTimeTagNode: ASButtonNode!        //标签
    var _limitNode: ASTextNode!                 //限量
    var _specialPriceNode: ASTextNode!          //特卖价格
    var _normalPriceNode: ASTextNode!           //平时价
    var _shareButtonNode: ASButtonNode!         //分享
    var _bottomToolBarNode: ASImageNode!        //底部工具条
    var _onLineCountNode: ASTextNode!           //商家数目
    var _earningNode: ASTextNode!               //收益
    var _lineStatusNode: ASTextNode!            //上下架状态
    var _lineSwitchButton: UISwitch!            //上下架开关
    var _lineSwitchBGNode: ASDisplayNode!       //上下架开关背景（协助UISwith 位置）
    var _nationalFlagNode: ASNetworkImageNode!  //过期
    var _nationalNameNode: ASTextNode!          //国家名
    var _isHaiTao: Bool!                        //海淘商品
    
    override init() {
        super.init()
    }
    
    func initNodeCell(haitao: Bool) -> TableViewNodeCell {
        let node: TableViewNodeCell = TableViewNodeCell()
        node.backgroundColor = UIColor.white
        node.selectionStyle = .none
        node.updateHomePageCellNode(haitao: haitao)
        return node
    }
    
    func updateHomePageCellNode(haitao: Bool) -> Void {
        _isHaiTao = haitao
        addTitleNode(title: "[SKII]珀莱雅靓白肌密明星面霜")
        addMainGoodsImageNode(imageUrl: "https://www.baidu.com/img/bd_logo1.png")
        addGoodsTimeTagNode(text: "10:00 未开抢")
        addLimitNode(text: "限量: 200")
        addSpecialPriceNode(text: "特卖价:¥175")
        addNormalPriceNode(text: "平时:¥243.00")
        addShareButtonNode()
        addBottomToolBarNode()
        addOnLineCountNode(text: "已被1980位店主上架")
        addEarningNode(text: "收益: 47.5")
        addLineStatusNode(text: "上架")
        addLineSwitchBackgroundNode()
        addGoodsTypeTagNode(image: UIImage(named: "home_cell_empty_icon"))
        addNationalFlagNode(imageUrl: nil)
        addNationalNameNode(text: "China 中国直供")
    }
    
    override func layout() {
        super.layout()
        
        _lineSwitchButton.frame = _lineSwitchBGNode.frame
    }
    
    override func didLoad() {
        super.didLoad()
        addLineSwitchButton()
        _isHaiTao = false
    }
}

extension TableViewNodeCell {
    // 标题
    func addTitleNode(title: String) -> Void {
        let attString: NSAttributedString = WuisxKit.nodeAttributesString(text: title, textColor: UIColor.black, font: FONT_PingFangSC_Light(s: 16))
        let textNode: ASTextNode = WuisxKit.nodeTextNodeAdd(addNode: self)
        textNode.attributedText = attString
        textNode.maximumNumberOfLines = 2
        textNode.style.flexShrink = 1
        _titleNode = textNode
    }
    
    // 图片
    func addMainGoodsImageNode(imageUrl: String) -> Void {
        let networkImageNode: ASNetworkImageNode = WuisxKit.nodeNetworkImageNodeAdd(addNode: self, clipsToBounds: false, contentMode: .scaleAspectFill, defaultImage: UIImage(named: "luisX"))
        networkImageNode.style.preferredSize = CGSize(width: 100, height: 100)
        networkImageNode.url = URL.init(string: imageUrl)
        _goodsImageNode = networkImageNode
    }
    
    // 标签
    func addGoodsTimeTagNode(text: String) {
        let buttonNode: ASButtonNode = WuisxKit.nodeButtonNodeAdd(addNode: self, title: text, titleColor: UIColor.white, font: FONT_PingFangSC_Light(s: 12), cornerRadius: 25/2, backgroundColor: UIColor(displayP3Red: 0.97, green: 0.15, blue: 0.41, alpha: 1.00), contentVerticalAlignment: .center, contentHorizontalAlignment: .middle)
        buttonNode.style.minSize = CGSize(width: 90, height: 25)
        _goodsTimeTagNode = buttonNode
    }
    
    // 限量
    func addLimitNode(text: String) {
        let attString: NSAttributedString = WuisxKit.nodeAttributesString(text: text, textColor: UIColor.black, font: FONT_PingFangSC_Light(s: 12))
        let textNode: ASTextNode = WuisxKit.nodeTextNodeAdd(addNode: self)
        textNode.attributedText = attString
        textNode.maximumNumberOfLines = 1
        textNode.style.flexShrink = 1
        _limitNode = textNode
    }
    
    // 特卖价
    func addSpecialPriceNode(text: String) {
        let attString: NSAttributedString = WuisxKit.nodeAttributesString(text: text, textColor: UIColor.black, font: FONT_PingFangSC_Light(s: 14))
        let textNode: ASTextNode = WuisxKit.nodeTextNodeAdd(addNode: self)
        textNode.attributedText = attString
        textNode.maximumNumberOfLines = 1
        textNode.style.flexShrink = 1
        _specialPriceNode = textNode
    }
    
    // 平时价
    func addNormalPriceNode(text: String) {
        let attString: NSAttributedString = WuisxKit.nodeAttributesString(text: text, textColor: UIColor.black, font: FONT_PingFangSC_Light(s: 12))
        let textNode: ASTextNode = WuisxKit.nodeTextNodeAdd(addNode: self)
        textNode.attributedText = attString
        textNode.maximumNumberOfLines = 1
        textNode.style.flexShrink = 1
        _normalPriceNode = textNode
    }
    
    // 分享
    func addShareButtonNode() {
        let buttonNode: ASButtonNode = ASButtonNode.init()
        buttonNode.setImage(UIImage(named: "home_share_normal"), for: .normal)
        buttonNode.setImage(UIImage(named: "home_share_selected"), for: .highlighted)
        buttonNode.setBackgroundImage(UIImage(named: "home_share_button"), for: .normal)
        buttonNode.setBackgroundImage(UIImage(named: "home_share_button"), for: .highlighted)
        buttonNode.imageAlignment = .beginning
        buttonNode.contentVerticalAlignment = .center
        buttonNode.contentHorizontalAlignment = .middle
        buttonNode.style.preferredSize = CGSize(width: 43, height: 36)
        self.addSubnode(buttonNode)
        _shareButtonNode = buttonNode
    }
    
    // 工具条
    func addBottomToolBarNode() {
        let imageNode = WuisxKit.nodeImageNodeAdd(addNode: self, clipsToBounds: false, contentMode: .scaleToFill)
        imageNode.image = UIImage(named: "home_cell_bottom_bg")
        imageNode.style.height = ASDimensionMake(38)
        _bottomToolBarNode = imageNode
    }
    
    // 上架数目
    func addOnLineCountNode(text: String) {
        let attString: NSAttributedString = WuisxKit.nodeAttributesString(text: text, textColor: UIColor.black, font: FONT_PingFangSC_Light(s: 14))
        let textNode: ASTextNode = WuisxKit.nodeTextNodeAdd(addNode: self)
        textNode.attributedText = attString
        textNode.maximumNumberOfLines = 1
        textNode.style.flexShrink = 1
        _onLineCountNode = textNode
    }
    
    // 收益
    func addEarningNode(text: String) {
        let attString: NSAttributedString = WuisxKit.nodeAttributesString(text: text, textColor: UIColor.black, font: FONT_PingFangSC_Light(s: 14))
        let textNode: ASTextNode = WuisxKit.nodeTextNodeAdd(addNode: self)
        textNode.attributedText = attString
        textNode.maximumNumberOfLines = 1
        textNode.style.flexShrink = 1
        _earningNode = textNode
    }
    
    // 上下架状态
    func addLineStatusNode(text: String) {
        let attString: NSAttributedString = WuisxKit.nodeAttributesString(text: text, textColor: UIColor.black, font: FONT_PingFangSC_Light(s: 14))
        let textNode: ASTextNode = WuisxKit.nodeTextNodeAdd(addNode: self)
        textNode.attributedText = attString
        textNode.maximumNumberOfLines = 1
        _lineStatusNode = textNode
    }
    
    // 上下架开关位置
    func addLineSwitchBackgroundNode() {
        let displayNode: ASDisplayNode = WuisxKit.nodeDisplayNodeAdd(addNode: self, backgroundColor: UIColor.clear)
        displayNode.style.preferredSize = CGSize(width: 41, height: 25)
        displayNode.isLayerBacked = true
        _lineSwitchBGNode = displayNode
    }
    
    // 上下架开关
    func addLineSwitchButton() {
        let switchButton: UISwitch = UISwitch.init()
        switchButton.backgroundColor = UIColor.clear
        switchButton.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
        switchButton.tintColor = UIColor(displayP3Red: 0.85, green: 0.84, blue: 0.84, alpha: 1.00)
        switchButton.thumbTintColor = UIColor.white
        switchButton.onTintColor = UIColor(displayP3Red: 0.97, green: 0.15, blue: 0.41, alpha: 1.00)
        self.view.addSubview(switchButton)
        _lineSwitchButton = switchButton
    }
    
    // 商品类别标签（海淘/特卖）
    func addGoodsTypeTagNode(image: UIImage?) {
        let imageNode: ASImageNode = WuisxKit.nodeImageNodeAdd(addNode: self, clipsToBounds: false, contentMode: .scaleToFill)
        imageNode.image = image
        imageNode.style.layoutPosition = CGPoint(x: 0, y: 0)
        imageNode.style.preferredSize = CGSize(width: 30, height: 30)
        _goodsTypeTagNode = imageNode
    }
    
    // 国旗
    func addNationalFlagNode(imageUrl: String?) {
        let networkImageNode: ASNetworkImageNode = WuisxKit.nodeNetworkImageNodeAdd(addNode: self, clipsToBounds: true, contentMode: .scaleAspectFit, defaultImage: UIImage(named: "home_china_flag"))
        networkImageNode.style.preferredSize = CGSize(width: 25, height: 15)
        _nationalFlagNode = networkImageNode
    }
    
    // 国家文本
    func addNationalNameNode(text: String) {
        let attString: NSAttributedString = WuisxKit.nodeAttributesString(text: text, textColor: UIColor.black, font: FONT_PingFangSC_Light(s: 14))
        let textNode: ASTextNode = WuisxKit.nodeTextNodeAdd(addNode: self)
        textNode.attributedText = attString
        textNode.maximumNumberOfLines = 1
        textNode.style.flexShrink = 1
        _nationalNameNode = textNode
    }
}

extension TableViewNodeCell {
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        // 国旗/国家 --- 水平布局
        let nationStack: ASStackLayoutSpec = ASStackLayoutSpec.init(direction: .horizontal,
                                                                    spacing: 5,
                                                                    justifyContent: .start,
                                                                    alignItems: .center,
                                                                    children: [ _nationalFlagNode, _nationalNameNode ])
        
        // 时间标签/限量 --- 水平约束
        let tagStack: ASStackLayoutSpec = ASStackLayoutSpec.init(direction: .horizontal,
                                                                 spacing: 10,
                                                                 justifyContent: .start,
                                                                 alignItems: .center,
                                                                 children: [ _goodsTimeTagNode, _limitNode ])
        
        // 特卖/平时 -- 水平约束
        let priceStack: ASStackLayoutSpec = ASStackLayoutSpec.init(direction: .horizontal,
                                                                   spacing: 17,
                                                                   justifyContent: .start,
                                                                   alignItems: .center,
                                                                   children: [ _specialPriceNode, _normalPriceNode ])
        
        // 商品内容 --- 竖直约束
        let contentStack: ASStackLayoutSpec = ASStackLayoutSpec.init(direction: .vertical,
                                                                     spacing: 5,
                                                                     justifyContent: .spaceBetween,
                                                                     alignItems: .stretch,
                                                                     children: [])
        
        contentStack.style.flexShrink = 1
        if _isHaiTao {
            contentStack.children = [ nationStack, _titleNode, priceStack ]
        } else {
            contentStack.children = [ tagStack, _titleNode, priceStack ]
        }
        
        // 商品图类型标签 --- 水平约束
        let typeTagAbsolute: ASAbsoluteLayoutSpec = ASAbsoluteLayoutSpec.init(sizing: .default, children: [ _goodsTypeTagNode, _goodsImageNode ])
        
        // 商品图 --- 水平约束
        let goodsImageContentStack: ASStackLayoutSpec = ASStackLayoutSpec.init(direction: .horizontal,
                                                                               spacing: 10,
                                                                               justifyContent: .start,
                                                                               alignItems: .stretch,
                                                                               children: [ typeTagAbsolute, contentStack ])
        goodsImageContentStack.style.flexShrink = 1
        
        // 商品图 -- 水平分享
        let shareContentStack: ASStackLayoutSpec = ASStackLayoutSpec.init(direction: .horizontal,
                                                                          spacing: 5,
                                                                          justifyContent: .spaceBetween,
                                                                          alignItems: .center,
                                                                          children: [ goodsImageContentStack, _shareButtonNode ])
        
        //MARK: - 工具条约束
        // 收益/上架状态/上架按钮 --- 水平约束
        let bottomToolRightStack: ASStackLayoutSpec = ASStackLayoutSpec.init(direction: .horizontal,
                                                                               spacing: 10,
                                                                               justifyContent: .end,
                                                                               alignItems: .center,
                                                                               children: [ _earningNode, _lineStatusNode, _lineSwitchBGNode ])
        bottomToolRightStack.style.flexGrow = 1
        
        // 工具条内容 --- 水平约束
        let bottomToolContentStack: ASStackLayoutSpec = ASStackLayoutSpec.init(direction: .horizontal,
                                                                               spacing: 10,
                                                                               justifyContent: .spaceBetween,
                                                                               alignItems: .center,
                                                                               children: [ _onLineCountNode, bottomToolRightStack ])
        
        // 工具条内容边框 --- 边框约束
        let bottomToolContentInset: ASInsetLayoutSpec = ASInsetLayoutSpec.init(insets: UIEdgeInsets(top: 8, left: 10, bottom: 0, right: 13), child: bottomToolContentStack)
        
        // 工具条 --- 边框约束
        let bottomToolInset: ASInsetLayoutSpec = ASInsetLayoutSpec.init(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10), child: _bottomToolBarNode)
        
        // 工具条背景
        let bottomToolBackground: ASBackgroundLayoutSpec = ASBackgroundLayoutSpec.init(child: bottomToolInset, background: bottomToolContentInset)
        
        //MARK: - 内容/工具条 --- 整体约束
        let allContentStack: ASStackLayoutSpec = ASStackLayoutSpec.init(direction: .vertical,
                                                                        spacing: 5,
                                                                        justifyContent: .spaceBetween,
                                                                        alignItems: .stretch,
                                                                        children: [ shareContentStack, bottomToolBackground ])
        
        return ASInsetLayoutSpec.init(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0), child: allContentStack)
    }
}
