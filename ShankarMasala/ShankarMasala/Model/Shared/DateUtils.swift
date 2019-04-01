
import UIKit

class DateUtils: NSObject {
    
    class func getStringFormat(str:String) -> String {        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/M/yy"
        let date: Date = dateFormatterGet.date(from: str)!
        print(date)
        return dateFormatterPrint.string(from: date)
    }
    
    class func getDateString(date:Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        return dateFormatterPrint.string(from: date)
    }
    
    class func getCantinaDateString(date:Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return dateFormatterPrint.string(from: date)
    }
    
    class func getDateStringddMyy(date:Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.M.yy"
        return dateFormatterPrint.string(from: date)
    }
    
    class func getDateStringddMyyWithFormat(date:Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/M/yy"
        return dateFormatterPrint.string(from: date)
    }
    
    class func getDateStringDash(date:Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatterPrint = DateFormatter()
        //TODO: -- Changed For Add Vehicle Date Format ad it is not used anywhere else
        //dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        dateFormatterPrint.dateFormat = "MM/dd/yyyy"
        return dateFormatterPrint.string(from: date)
    }
    
    class func getDateStringDashToDate(date:String) -> Date {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MM/dd/yyyy"
        let dateFormatterPrint = DateFormatter()
        //TODO: -- Changed For Add Vehicle Date Format ad it is not used anywhere else
        //dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        dateFormatterPrint.dateFormat = "MM/dd/yyyy"
        return dateFormatterPrint.date(from: date)!
    }
    
    
    
    class func getDateStringFormat(date:Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyyMMdd"
        return dateFormatterPrint.string(from: date)
    }
    
    class func getDateStringTime(date:Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "HH:mm"
        return dateFormatterPrint.string(from: date)
    }
    
    class func getSameDateFormat(date:Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
        return dateFormatterPrint.string(from: date)
    }
    
    class func getYearFromDate(date:Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy"
        return dateFormatterPrint.string(from: date)
    }
}
