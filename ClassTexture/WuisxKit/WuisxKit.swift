//
//  WuisxKit.swift
//  ClassTexture
//
//  Created by yuhanle on 2018/7/6.
//  Copyright © 2018年 yuhanle. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class WuisxKit: NSObject {
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - text: <#text description#>
    ///   - textColor: <#textColor description#>
    ///   - font: <#font description#>
    /// - Returns: <#return value description#>
    class func nodeAttributesString(text: String, textColor: UIColor, font: UIFont) -> NSAttributedString {
        let attributesDic: NSDictionary = [
            NSAttributedStringKey.font: font,
            NSAttributedStringKey.foregroundColor: textColor
        ]
        
        let attributesString: NSAttributedString = NSAttributedString.init(string: text, attributes: attributesDic as? [NSAttributedStringKey : Any])
        return attributesString
    }
    
    
    /// <#Description#>
    ///
    /// - Parameter addNode: <#addNode description#>
    /// - Returns: <#return value description#>
    class func nodeTextNodeAdd(addNode: ASDisplayNode) -> ASTextNode {
        let textNode: ASTextNode = ASTextNode.init()
        addNode.addSubnode(textNode)
        return textNode
    }
    
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - addNode: <#addNode description#>
    ///   - clipsToBounds: <#clipsToBounds description#>
    ///   - contentMode: <#contentMode description#>
    ///   - defaultImage: <#defaultImage description#>
    /// - Returns: <#return value description#>
    class func nodeNetworkImageNodeAdd(addNode: ASDisplayNode, clipsToBounds: Bool, contentMode: UIViewContentMode, defaultImage: UIImage?) -> ASNetworkImageNode {
        let networkImageNode: ASNetworkImageNode = ASNetworkImageNode.init()
        
        if defaultImage != nil {
            networkImageNode.defaultImage = defaultImage
        }
        networkImageNode.clipsToBounds = clipsToBounds
        networkImageNode.contentMode = contentMode
        addNode.addSubnode(networkImageNode)
        return networkImageNode
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - addNode: <#addNode description#>
    ///   - title: <#title description#>
    ///   - titleColor: <#titleColor description#>
    ///   - font: <#font description#>
    ///   - cornerRadius: <#cornerRadius description#>
    ///   - backgroundColor: <#backgroundColor description#>
    ///   - contentVerticalAlignment: <#contentVerticalAlignment description#>
    ///   - contentHorizontalAlignment: <#contentHorizontalAlignment description#>
    /// - Returns: <#return value description#>
    class func nodeButtonNodeAdd(addNode: ASDisplayNode, title: String?, titleColor: UIColor, font: UIFont, cornerRadius: CGFloat, backgroundColor: UIColor, contentVerticalAlignment: ASVerticalAlignment, contentHorizontalAlignment: ASHorizontalAlignment) -> ASButtonNode {
        let buttonNode: ASButtonNode = ASButtonNode.init()
        buttonNode.backgroundColor = backgroundColor
        if title != nil {
            buttonNode.setTitle(title!, with: font, with: titleColor, for: .normal)
        }
        buttonNode.contentVerticalAlignment = contentVerticalAlignment
        buttonNode.contentHorizontalAlignment = contentHorizontalAlignment
        buttonNode.cornerRadius = cornerRadius
        addNode.addSubnode(buttonNode)
        return buttonNode
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - addNode: <#addNode description#>
    ///   - clipsToBounds: <#clipsToBounds description#>
    ///   - contentMode: <#contentMode description#>
    /// - Returns: <#return value description#>
    class func nodeImageNodeAdd(addNode: ASDisplayNode, clipsToBounds: Bool, contentMode: UIViewContentMode) -> ASImageNode {
        let imageNode: ASImageNode = ASImageNode.init()
        imageNode.clipsToBounds = clipsToBounds
        imageNode.contentMode = contentMode
        addNode.addSubnode(imageNode)
        return imageNode
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - addNode: <#addNode description#>
    ///   - backgroundColor: <#backgroundColor description#>
    class func nodeDisplayNodeAdd(addNode: ASDisplayNode, backgroundColor: UIColor) -> ASDisplayNode {
        let displayNode: ASDisplayNode = ASDisplayNode.init()
        displayNode.backgroundColor = backgroundColor
        addNode.addSubnode(displayNode)
        return displayNode
    }
}
