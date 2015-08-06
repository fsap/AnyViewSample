import CoreData

extension NSManagedObject {

    public class var entityName:String {
        get {
            // NSManagedObject及びそのサブクラスはObjective-Cクラスなので、
            // NSStringFromClass(self)の結果が素直な名前になります。
            // 具体的にはモジュール名.クラス名を返します。
            // ここでは.でセパレートしてクラス名だけを返すようにしています。
            return NSStringFromClass(self).componentsSeparatedByString(".").last!
        }
    }

}