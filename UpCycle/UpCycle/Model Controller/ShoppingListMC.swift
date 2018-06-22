//
//  ShoppingListMC.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/19/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit

class ShoppingListMC {
    
    static var shoppingListItems: [ShoppingList] {
        
      let floss = ShoppingList(name: "Dental Floss", picture: "Floss", UrlAsString: "https://www.publicgoods.com/products/dental-floss?variant=53698529095&utm_source=google&utm_medium=cpc&utm_campaign=search&gclid=CjwKCAjw06LZBRBNEiwA2vgMVZ2UoeQ5VHzn6qAv5GMH70Pulaw0IoQxvV8DLVZdyk35CzgsRc1_4xoCN4MQAvD_BwE")
        
        let makeUpRemover = ShoppingList(name: "Makeup Remover Pads", picture: "makeupr", UrlAsString: "https://www.amazon.com/Ivory-Bamboo-Fleece-Makeup-Remover/dp/B06XWH41VS/ref=sr_1_2?s=home-garden&ie=UTF8&qid=1529432090&sr=1-2&keywords=reusable+makeup+remover&refinements=p_72%3A1248915011")
        
        let mCup = ShoppingList(name: "Menstrual Cup", picture: "mcup", UrlAsString: "https://www.amazon.com/Diva-Cup-Childbirth-Packaging-Vary/dp/B000FAG6X0/ref=sr_1_4_s_it?s=hpc&ie=UTF8&qid=1529450194&sr=1-4&keywords=diva%2Bcup&th=1")
        
        let bamTwl = ShoppingList(name: "Reusable Paper Towells", picture: "bamboot", UrlAsString: "https://www.amazon.com/Bambooee-Original-Reuseable-Washable-Replacement/dp/B00IFHNA48/ref=sr_1_5?s=home-garden&ie=UTF8&qid=1529431357&sr=1-5&keywords=reusable+paper+towels")
        
        let bamToB = ShoppingList(name: "Recyclable Toothbrush", picture: "bamTB", UrlAsString: "https://www.amazon.com/Weinisite-Eco-Friendly-Bristles-Bamboo-Toothbrush/dp/B014BG9H7A/ref=sr_1_7?s=home-garden&ie=UTF8&qid=1529432148&sr=1-7&keywords=eco+friendly+toothbrush")
        
        let watBot = ShoppingList(name: "Water Bottle", picture: "wbott", UrlAsString: "https://www.amazon.com/Hydro-Flask-Insulated-Stainless-Graphite/dp/B01GW2HGAG/ref=sr_1_28?s=home-garden&ie=UTF8&qid=1529431107&sr=1-28&keywords=water+bottle")
        
        let masJar = ShoppingList(name: "Mason Jars", picture: "mjar", UrlAsString: "https://www.amazon.com/Ball-Mason-Jar-16-Clear-Heritage/dp/B0764L6ZR9/ref=ice_ac_b_dpb?s=home-garden&ie=UTF8&qid=1529431070&sr=1-7&keywords=mason+jars")
        
        let proSav = ShoppingList(name: "Produce Savers", picture: "pS", UrlAsString: "https://www.amazon.com/REUSABLE-SILICONE-PROTECTORS-Vegetable-Containers/dp/B074S2JL11/ref=sr_1_9?s=home-garden&ie=UTF8&qid=1529430331&sr=1-9&keywords=fruit+savers")
        
        let straws = ShoppingList(name: "Straws", picture: "straws", UrlAsString: "https://www.amazon.com/REGULAR-Silicone-Straws-Tumbler-Stainless/dp/B074295RQ5/ref=sr_1_7?s=home-garden&ie=UTF8&qid=1529430275&sr=1-7&keywords=reusable")
        
        let zips = ShoppingList(name: "Ziplocks", picture: "zips", UrlAsString: "https://www.amazon.com/Nordic-Nature-Turquoise-Sandwich-Set/dp/B075B7FM3W/ref=sr_1_6?s=home-garden&ie=UTF8&qid=1529430177&sr=1-6&keywords=reusable+ziploc+bags")
        
        let bees = ShoppingList(name: "Syran Wrap", picture: "bees", UrlAsString: "https://www.amazon.com/Bees-Wrap-Assorted-Sustainable-Honeycomb/dp/B0126LMDFK/ref=zg_bs_3744031_1?_encoding=UTF8&psc=1&refRID=JJ4WE4WZN2X6AJHWMD0W")
        
        let handky = ShoppingList(name: "Handkerchiefs", picture: "hanky", UrlAsString: "https://www.amazon.com/EcoHanky-Cotton-Handkerchiefs-White-Pieces/dp/B071CSSNRG/ref=sr_1_3?s=apparel&ie=UTF8&qid=1529430140&sr=1-3&nodeID=7141123011&psd=1&keywords=reusable+tissues")
        
        let napkins = ShoppingList(name: "Dinner Napkins", picture: "nap", UrlAsString: "https://www.amazon.com/Utopia-Bedding-Cotton-Dinner-Napkins/dp/B00L1HZD1W/ref=sr_1_4?s=home-garden&ie=UTF8&qid=1529453704&sr=1-4&keywords=reusable%2Bnapkins&th=1")
        
        let box = ShoppingList(name: "Lunch Box", picture: "lunch", UrlAsString: "https://www.amazon.com/Unichart-Stainless-Insulated-Container-Storage/dp/B075197F7N/ref=sr_1_33?s=home-garden&ie=UTF8&qid=1529430038&sr=1-33&keywords=lunch+box")
        
        let tupWr = ShoppingList(name: "Food Containers", picture: "tup", UrlAsString: "https://www.amazon.com/13-Pack-Glass-Storage-Containers-Lids/dp/B075P1XHRR/ref=sr_1_1_sspa?s=home-garden&ie=UTF8&qid=1529429946&sr=1-1-spons&keywords=reusable+glass+tupperware&psc=1")
        
        let shop = ShoppingList(name: "Shopping Bags", picture: "bag", UrlAsString: "https://www.amazon.com/Reusable-Foldable-Attached-Polyester-Lightweight/dp/B01N6EGXUB/ref=sr_1_4?s=home-garden&rps=1&ie=UTF8&qid=1529429861&sr=1-4&keywords=reusable+shopping+bags&refinements=p_85%3A2470955011")
        
        let probag = ShoppingList(name: "Produce Bags", picture: "prob", UrlAsString: "https://www.amazon.com/Reusable-Produce-Vegetables-Through-Polyester/dp/B07B89LW2N/ref=ice_ac_b_dpb?s=kitchen&ie=UTF8&qid=1529429785&sr=1-7&keywords=reusable+produce+bags")
        
        return [floss, makeUpRemover, mCup, bamTwl, bamToB, watBot, masJar, proSav, straws, zips, bees, handky, napkins, box, tupWr, shop, probag]
    }
}



