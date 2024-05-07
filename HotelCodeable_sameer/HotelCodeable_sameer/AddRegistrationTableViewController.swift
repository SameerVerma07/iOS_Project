//
//  AddRegistrationTableViewController.swift
//  HotelCodeable_sameer
//
//  Created by Sameer Verma on Date 03 May 2024
//
//

import UIKit





class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate{
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        self.roomType=roomType
        updateRoomType()
    }
    
    
    //Section-1  outlet firstName lastName email

    @IBOutlet var firstNameTextFeild: UITextField!
    @IBOutlet var flastNameTextFeild: UITextField!
    @IBOutlet var emailTextFeild: UITextField!
    
    //Section - 2 outlet cheking date checkoutlabel
    
    @IBOutlet var checkinDateLabel: UILabel!
    @IBOutlet var checkinDatePicker: UIDatePicker!
    @IBOutlet var checkoutDateLabel: UILabel!
    @IBOutlet var checkoutDatePicker: UIDatePicker!
    
    
    //section 3 outlets
    
    @IBOutlet var numbersOfAdultsLabel: UILabel!
    @IBOutlet var numberOfAdultsStepper: UIStepper!
    @IBOutlet var numbersOfChildrenLabel: UILabel!
    @IBOutlet var numberOfChildrenStepper: UIStepper!
    
//    section 4 wifi
    
    @IBOutlet var wifiSwitch: UISwitch!
    //section 5
    @IBOutlet var roomTypeLabel: UILabel!
    @IBOutlet var doneButtonTapped: UIBarButtonItem!
    
    //here are section 6
    @IBOutlet var numberOfNightsLabel: UILabel!
    @IBOutlet var dateOfNightsLabel: UILabel!
    @IBOutlet var costOfRoomLabel: UILabel!
    @IBOutlet var detailInfoRoomLabel: UILabel!
    @IBOutlet var totalCostOfWiFiLabel: UILabel!
    @IBOutlet var infoWiFiLabel: UILabel!
    @IBOutlet var totalCostLabel: UILabel!
    
    
    //Cancel Button Tapped Action
    @IBAction func CancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    //variables to be used
    var roomType: RoomType?
    var wifiTotalPrice = 0
    var roomPrice = 0
    
    
    
    //varibales for date picker visibility
    var isCheckInDatePickerVisible:Bool = false{
        didSet{
            checkinDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    var isCheckOutDatePickerVisible:Bool = false{
        didSet{
            checkoutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    var checkInDateLabelIndexPath = IndexPath(row: 0, section: 1)
    var checkInDatePickerIndexPath = IndexPath(row: 1, section: 1)
    var checkOutDateLabelIndexPath = IndexPath(row: 2, section: 1)
    var checkOutDatePickerIndexPath = IndexPath(row: 3, section: 1)
    
    
    var registration : Registration?{
        let firstName = firstNameTextFeild.text ?? ""
        let lastName = flastNameTextFeild.text ?? ""
        let email = emailTextFeild.text ?? ""
        let checkinDate = checkinDatePicker.date
        let checkoutDate = checkoutDatePicker.date
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let hasWifi = wifiSwitch.isOn
        guard let roomChoice =  roomType else {return nil}
        
        return Registration(firstName: firstName, lastName: lastName, emailAddress: email, checkInDate: checkinDate, checkOutDate: checkoutDate, numberOfAdult: numberOfAdults, numberOfChild: numberOfChildren, wifi: hasWifi, roomType: roomChoice)
    }
    
    override func viewDidLoad() {
        let midnightToday = Calendar.current.startOfDay(for: Date())
        wifiSwitch.isOn = false
        checkinDatePicker.minimumDate = midnightToday
        checkinDatePicker.date = midnightToday
        super.viewDidLoad()
        
        updateDateview()
        updateNumberOfGuests()
        updateRoomType()
        
        //copy
        updateSaveButtonState()
        updateNumberOfNights()
        updateWiFiLabels()
        updateTotalCost()
        
       
    }
    
    
    func updateWiFiLabels() {
        if wifiSwitch.isOn {
            let price = Int(numberOfNightsLabel.text ?? "1")! * 10
            wifiTotalPrice = price
            totalCostOfWiFiLabel.text = "$ \(price)"
            infoWiFiLabel.text = "Yes"
        } else {
            wifiTotalPrice = 0
            totalCostOfWiFiLabel.text = "$ 0"
            infoWiFiLabel.text = "No"
        }
    }
    func updateNumberOfNights() {
        let days = Calendar.current.dateComponents([.day], from: checkinDatePicker.date, to: checkoutDatePicker.date).day
        numberOfNightsLabel.text = String(days ?? 1)
        dateOfNightsLabel.text = (checkinDateLabel.text ?? "") + " - " + (checkoutDateLabel.text ?? "")
    }
    func updateSaveButtonState() {
        let nameText = firstNameTextFeild.text ?? ""
        let lastName = flastNameTextFeild.text ?? ""
        let emailText = emailTextFeild.text ?? ""
        doneButtonTapped.isEnabled = !nameText.isEmpty && !lastName.isEmpty && !emailText.isEmpty && registration != nil
    }
    
    func updateTotalCost() {
        let totalPrice = wifiTotalPrice + roomPrice
        totalCostLabel.text = "$ \(totalPrice)"
    }
    
//    @IBAction func doneBarButtonTap(_ sender: UIBarButtonItem) {
//        print("DONE BUTTON TAP")
//        let firstName = firstNameTextFeild.text ?? ""
//        let lastName = flastNameTextFeild.text ?? ""
//        let email = emailTextFeild.text ?? ""
//        let checkinDate = checkinDatePicker.date
//        let checkoutDate = checkoutDatePicker.date
//        let numberOfChildren = Int(numberOfChildrenStepper.value)
//        let numberOfAdults = Int(numberOfAdultsStepper.value)
//        let hasWifi = wifiSwitch.isOn
//        let roomChoice =  roomType?.name ?? "Not set"
//         
//        
//        print("firstName: \(firstName)")
//        print("lastName: \(lastName)")
//        print("email: \(email)")
//        print("Checkin Date \(checkinDate.formatted(date: .abbreviated, time: .omitted))")
//        print("CheckOut Date \(checkoutDate.formatted(date: .abbreviated, time: .omitted))")
//        
//        print("Number of Adults :\(numberOfAdults)")
//        print("Number of Children :\(numberOfChildren)")
//        print("Wifi: \(hasWifi)")
//        print("room Type: \(roomChoice)")
//        
//    }
    
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        updateWiFiLabels()
        updateTotalCost()
        
    }
    
    
    func updateNumberOfGuests(){
        numbersOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numbersOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
        
    }
    
    
    
    
    
    
    func updateDateview(){
        checkoutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkinDatePicker.date)
        checkinDateLabel.text = checkinDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkoutDateLabel.text = checkoutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateview()
        updateNumberOfNights()
        updateRoomType()
        updateWiFiLabels()
        updateTotalCost()
    }
    
    
    @IBAction func wifiAwitchChanged(_ sender: UISwitch) {
        updateWiFiLabels()
        updateTotalCost()

        
    }
    func selectRoomTypeTVC(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
        updateTotalCost()
    }
    
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeTableViewController = SelectRoomTypeTableViewController(coder:  coder)
        selectRoomTypeTableViewController?.delegate = self
        selectRoomTypeTableViewController?.selectedRoomType = roomType
        return selectRoomTypeTableViewController
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case checkInDatePickerIndexPath:
            if isCheckInDatePickerVisible{
                return 217
            }
            else{
                return 0
            }
        case checkOutDatePickerIndexPath:
            if isCheckOutDatePickerVisible{
                return 217
            }
            else{
                return 0
            }
        default:
            return UITableView.automaticDimension
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateSaveButtonState()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == checkInDateLabelIndexPath && isCheckOutDatePickerVisible == false {
            isCheckInDatePickerVisible.toggle()
        }
        else if indexPath == checkOutDateLabelIndexPath && isCheckInDatePickerVisible == false{
            isCheckOutDatePickerVisible.toggle()
        }
        else if indexPath == checkInDateLabelIndexPath || indexPath == checkOutDateLabelIndexPath {
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible.toggle()
        }
        else{
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func updateRoomType(){
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
            let price = Int(numberOfNightsLabel.text ?? "1")! * roomType.price
            self.roomPrice = price
            costOfRoomLabel.text = "$ \(price)"
            detailInfoRoomLabel.text = "\(roomType.name) @ $\(roomType.price)/night"
        }
        else{
            roomTypeLabel.text = "Not Set"
            costOfRoomLabel.text = "$ 0"
            detailInfoRoomLabel.text = "Not Set"
        }
    }
    
    
    

    
}
