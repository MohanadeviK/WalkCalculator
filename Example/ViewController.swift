//
//  ViewController.swift
//  Example
//
//  Created by Mohandevi on 18/02/17.
//  Copyright © 2017 test. All rights reserved.
//

//MARK: Extension Class

//CollectionView Datasource Methods

extension ViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        var checkState : Bool?

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCollectionViewCell", for: indexPath) as! SectionCollectionViewCell
        cell.sectionImageView.image =  UIImage(named: self.images[indexPath.item])
        cell.sectionTitleLbl.text = self.sectionTitle[indexPath.item]
        cell.sectionExpLbl.text = self.sectionValues[indexPath.item]
        
        if indexPath.item == selectedIndex?.item
        {
            checkState = true
        }
        else
        {
            checkState = false
        }
        selectedFontColorChange(cv: collectionView, cell: cell , checkState: checkState!)

        return cell
    }
    
}

extension ViewController : UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        let cell = collectionView.cellForItem(at: indexPath as IndexPath) as! SectionCollectionViewCell
        selectedFontColorChange(cv: collectionView, cell: cell , checkState: true)
        
        if selectedIndex != nil
        {
            let preCell = collectionView.cellForItem(at: selectedIndex as! IndexPath) as? SectionCollectionViewCell
            if preCell != nil
            {
                selectedFontColorChange(cv: collectionView, cell: preCell! , checkState: false)
            }
            
            if selectedIndex?.item == indexPath.item
            {
                selectedIndex = nil
            }
            else
            {
                selectedIndex = indexPath as NSIndexPath?
                
            }
        }
        else
        {
            selectedIndex = indexPath as NSIndexPath?
            
        }


        if indexPath.item == 0
        {
          self.firstView.alpha = 1
            self.secondView.alpha = 0
        }
        if indexPath.item == 1
        {
            self.firstView.alpha = 0
            self.secondView.alpha = 1
  
        }
    }
}

import UIKit
import ObjectMapper

class ViewController: UIViewController
{
    //MARK: Properties
    
    var walk : Walk?
    var date1 = NSDate()
    let images = ["Composite", "Spanish Tile- Clay", "Metal", "Spanish Tile- Concrete-1", "Tar & Gravel", "Wood"]
    let sectionTitle = ["Week", "Steps", "MindMap", "Products", "Services", "Average"]
    var selectedIndex : NSIndexPath?
    let sectionValues = ["The week of June 6", "Average 1,790 steps per day", "Daily patterns of work", "average", "steps day", "years"]
    
    //MARK: Outlets
    
    //Labels
    
    
    @IBOutlet weak var day2View: UIView!
    @IBOutlet weak var day1view: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var date1Lbl: UILabel!
    @IBOutlet weak var day1Lbl: UILabel!
    @IBOutlet weak var date7LBl: UILabel!
    @IBOutlet weak var day7Lbl: UILabel!
    @IBOutlet weak var date6Lbl: UILabel!
    @IBOutlet weak var day6Lbl: UILabel!
    @IBOutlet weak var date5Lbl: UILabel!
    @IBOutlet weak var day5Lbl: UILabel!
    @IBOutlet weak var date4Lbl: UILabel!
    @IBOutlet weak var day4Lbl: UILabel!
    @IBOutlet weak var date3Lbl: UILabel!
    @IBOutlet weak var day3Lbl: UILabel!
    @IBOutlet weak var date2Lbl: UILabel!
    @IBOutlet weak var day2Lbl: UILabel!
    
    
    @IBOutlet weak var day7StepsLbl: UILabel!
    @IBOutlet weak var day6StepsLbl: UILabel!
    @IBOutlet weak var day5StepsLbl: UILabel!
    @IBOutlet weak var day4StepsLbl: UILabel!
    @IBOutlet weak var day3StepsLbl: UILabel!
    @IBOutlet weak var day2StepsLbl: UILabel!
    @IBOutlet weak var day1StepsLbl: UILabel!
    
    @IBOutlet weak var stepsSuggestionLbl: UILabel!
    @IBOutlet weak var totalStepsLbl: UILabel!
    
    //Button
    
    @IBOutlet weak var shareCardBtn: UIButton!
    
    //UIView
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var day7View: UIView!
    @IBOutlet weak var day6View: UIView!
    @IBOutlet weak var day5View: UIView!
    @IBOutlet weak var day4View: UIView!
    @IBOutlet weak var day3View: UIView!
    
    //MARK: View LifeCycle
    
    //DidLoad()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.shareCardBtn.layer.cornerRadius = 25
        self.shareCardBtn.layer.borderWidth = 2
        self.shareCardBtn.layer.borderColor = UIColor.uicolorFromHex(0x7EC0EE, alpha: 1.0).cgColor
        
        do {
            if let file = Bundle.main.url(forResource: "data", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any]
                {
                    // json is a dictionary
                    print(object)
                    
                    if let walkedDetails = Mapper<Walk>().map(JSON: object)
                    {
                        // display title
                        
                        let frtDtStr = walkedDetails.walk_details?.steps_details?.first?.date
                        let secondDtStr = walkedDetails.walk_details?.steps_details?[1].date
                        let thirdDtStr = walkedDetails.walk_details?.steps_details?[2].date
                        let fourthDtStr = walkedDetails.walk_details?.steps_details?[3].date
                        let fifthDtStr = walkedDetails.walk_details?.steps_details?[4].date
                        let sixthDtStr = walkedDetails.walk_details?.steps_details?[5].date
                        let lastDtStr = walkedDetails.walk_details?.steps_details?.last?.date

                        
                        
                        let dtFormater = DateFormatter()
                        dtFormater.dateFormat = "dd-MM-yyyy"
                        let frtDate = dtFormater.date(from: frtDtStr!)
                        let secondDate = dtFormater.date(from: secondDtStr!)
                        let thirdDate = dtFormater.date(from: thirdDtStr!)
                        let fourthDate = dtFormater.date(from: fourthDtStr!)
                        let fifthDate = dtFormater.date(from: fifthDtStr!)
                        let sixthDate = dtFormater.date(from: sixthDtStr!)
                        let lastDate = dtFormater.date(from: lastDtStr!)

        
                        let mnFormater = DateFormatter()
                        mnFormater.dateFormat = "MMM"
                        let month = mnFormater.string(from: frtDate!)

                     
                        let frdate = self.getDate(date: frtDate!)
                        let ladate =  self.getDate(date: lastDate!)
                        
                        self.dateLbl.text = "\(month) \(frdate)-\(ladate)"
                        
                        
                        // display foot steps
                        let day1 = self.addSteps(steps: walkedDetails.walk_details?.steps_details?[0].steps)
                        self.day1StepsLbl.text = self.round(value: day1)
                        
                        let day2 = self.addSteps(steps: walkedDetails.walk_details?.steps_details?[1].steps)
                        self.day2StepsLbl.text =  self.round(value: day2)

                        let day3 = self.addSteps(steps: walkedDetails.walk_details?.steps_details?[2].steps)
                        self.day3StepsLbl.text =  self.round(value: day3)

                        let day4 = self.addSteps(steps: walkedDetails.walk_details?.steps_details?[3].steps)
                        self.day4StepsLbl.text =  self.round(value: day4)

                        let day5 = self.addSteps(steps: walkedDetails.walk_details?.steps_details?[4].steps)
                        self.day5StepsLbl.text =  self.round(value: day5)

                        let day6 = self.addSteps(steps: walkedDetails.walk_details?.steps_details?[5].steps)
                        self.day6StepsLbl.text =  self.round(value: day6)

                        let day7 = self.addSteps(steps: walkedDetails.walk_details?.steps_details?[6].steps)
                        self.day7StepsLbl.text =  self.round(value: day7)
                        
                        // display date for labels
                        
                        self.date1Lbl.text = self.getDate(date: frtDate!)
                        self.date2Lbl.text = self.getDate(date: secondDate!)
                        self.date3Lbl.text = self.getDate(date: thirdDate!)
                        self.date4Lbl.text = self.getDate(date: fourthDate!)
                        self.date5Lbl.text = self.getDate(date: fifthDate!)
                        self.date6Lbl.text = self.getDate(date: sixthDate!)
                        self.date7LBl.text = self.getDate(date: lastDate!)

                        self.day1Lbl.text = self.getWeekDay(date: frtDate!)
                        self.day2Lbl.text = self.getWeekDay(date: secondDate!)
                        self.day3Lbl.text = self.getWeekDay(date: thirdDate!)
                        self.day4Lbl.text = self.getWeekDay(date: fourthDate!)
                        self.day5Lbl.text = self.getWeekDay(date: fifthDate!)
                        self.day6Lbl.text = self.getWeekDay(date: sixthDate!)
                        self.day7Lbl.text = self.getWeekDay(date: lastDate!)
                        
                        
                        // dispaly suggestion
                        let total = (day1 + day2 + day3 + day4 + day5 + day6 + day7)
                        self.totalStepsLbl.text = String(total) + " Steps"
                        if total > 1800
                        {
                            self.stepsSuggestionLbl.text = "Superb!!! keep it up"
                        }
                        else
                        {
                             self.stepsSuggestionLbl.text = "Some more walking is recomended.It is < 1.8k"
                        }
                        
                    }
     
                }
                else if let object = json as? [Any]
                {
                    // json is an array
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addSteps(steps : [steps]?)->Int
    {
        if let steps = steps
        {
            var stepCount = 0
            
            for st in steps
            {
                if let noOfSt = st.no_of_steps
                {
                    stepCount = stepCount + noOfSt
                }
            }

            return stepCount
        }
        
        
       return 0
    }
    
    func round(value:Int)-> String
    {
        var vv = value

        var str = String(vv)
        
        if vv > 1000
        {
            let ci = ceil(Double(vv))
            vv = Int(ci / 1000)
            str = String(vv) + "K"
        }
        
        return str
    }
    
    func getDate(date : Date) -> String
    {
        let dtOnlyFormater = DateFormatter()
        dtOnlyFormater.dateFormat = "dd"
        return dtOnlyFormater.string(from: date)
    }
 
    func getWeekDay(date : Date) -> String
    {
        let weekFormater = DateFormatter()
        weekFormater.dateFormat = "EEE"
        return weekFormater.string(from: date)
    }
    
    //MARK: Helper Methods
    
    func selectedFontColorChange(cv : UICollectionView, cell : UICollectionViewCell, checkState : Bool)
    {
        let RTCell  = cell as! SectionCollectionViewCell
        
        if checkState == true
        {
            RTCell.sectionImageView.layer.borderWidth = 2.0
            RTCell.sectionImageView.layer.borderColor =  UIColor.uicolorFromHex(0xB9E7AD, alpha : 1.0).cgColor
        }
            
        else
        {
            RTCell.sectionImageView.layer.borderWidth = 2.0
            RTCell.sectionImageView.layer.borderColor = UIColor.uicolorFromHex(0x979797, alpha : 1.0).cgColor
        }
    }

}



