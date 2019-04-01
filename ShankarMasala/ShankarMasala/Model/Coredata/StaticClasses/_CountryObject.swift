// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CountryObject.swift instead.

import Foundation
import CoreData

public enum CountryObjectAttributes: String {
    case country_name = "country_name"
}

public enum CountryObjectRelationships: String {
    case states = "states"
}

open class _CountryObject: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "CountryObject"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _CountryObject.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var country_name: String?

    // MARK: - Relationships

    @NSManaged open
    var states: NSSet

    open func statesSet() -> NSMutableSet {
        return self.states.mutableCopy() as! NSMutableSet
    }

}

extension _CountryObject {

    open func addStates(_ objects: NSSet) {
        let mutable = self.states.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.states = mutable.copy() as! NSSet
    }

    open func removeStates(_ objects: NSSet) {
        let mutable = self.states.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.states = mutable.copy() as! NSSet
    }

    open func addStatesObject(_ value: State) {
        let mutable = self.states.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.states = mutable.copy() as! NSSet
    }

    open func removeStatesObject(_ value: State) {
        let mutable = self.states.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.states = mutable.copy() as! NSSet
    }

}

