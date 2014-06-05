// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let date = NSDate()



// TODO: Determine if we need to inherit from NSObject
class NiceDate : NSObject {
    
    // Public properties:
    
    // I'm not sure how I feel about this style
    // It looks a little ugly imo :p
    
    // Also is there a meta-er way to do this that isn't so repetitive?
    var second : Int {
    get {
        return components().second
    }
    set {
        let dateComponents = components()
        dateComponents.second = newValue
        date = calendar.dateFromComponents(dateComponents)
    }
    }
    
    var minute : Int {
    get {
        return components().minute
    }
    set {
        let dateComponents = components()
        dateComponents.minute = newValue
        date = calendar.dateFromComponents(dateComponents)
    }
    }
    
    var hour : Int {
    get {
        return components().hour
    }
    set {
        let dateComponents = components()
        dateComponents.hour = newValue
        date = calendar.dateFromComponents(dateComponents)
    }
    }
    
    var day : Int {
    get {
        return components().day
    }
    set {
        let dateComponents = components()
        dateComponents.day = newValue
        date = calendar.dateFromComponents(dateComponents)
    }
    }
    
    var month : Int {
    get {
        return components().month
    }
    set {
        let dateComponents = components()
        dateComponents.month = newValue
        date = calendar.dateFromComponents(dateComponents)
    }
    }
    
    var year : Int {
    get {
        return components().year
    }
    set {
        let dateComponents = components()
        dateComponents.year = newValue
        date = calendar.dateFromComponents(dateComponents)
    }
    }
    
    
    
    
    var date : NSDate
    var formatter : NSDateFormatter
    var dateFormat : String // optimize meeeee
    var timeZone : NSTimeZone
    
    // TODO how can I make/refactor these private?
    var calendar : NSCalendar;
    
    func components() -> NSDateComponents {
        return calendar.components(.CalendarUnitWeekday | .CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay | .CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate:date)
    }
    
    // Public methods:
    init(date : NSDate = NSDate(), dateFormat : String = "MM-dd-yyyy HH:mm:ss", calendarIdentifier : String = "") {
        self.date = date
        self.dateFormat = dateFormat
        formatter = NSDateFormatter()
        formatter.dateFormat = dateFormat
        calendar = NSCalendar(calendarIdentifier:calendarIdentifier)
        
        timeZone = NSCalendar.autoupdatingCurrentCalendar().timeZone
        
        super.init()
    }
    
    
    func unixTime() -> NSTimeInterval {
        return date.timeIntervalSince1970
    }
    
    override var description: String! {
    get {
        formatter.dateFormat = dateFormat
        formatter.timeZone = timeZone
        return formatter.stringFromDate(date)
    }
    }

}


let niceDate = NiceDate()
niceDate.calendar
niceDate.unixTime()
niceDate.year
niceDate.year = 2100
niceDate.year
niceDate

println(niceDate)
println("test")
