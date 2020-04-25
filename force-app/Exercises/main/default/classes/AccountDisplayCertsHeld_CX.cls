public with sharing class AccountDisplayCertsHeld_CX {

    private final Account acct;

    // Constructor used to get the Account record
    public AccountDisplayCertsHeld_CX(ApexPages.StandardController stdController) {
        this.acct = (Account) stdController.getRecord();
    }

    public List<Certification_Held__c> results {
        get {
            return [SELECT Id, Name, Date_Achieved__c, Certified_Professional__r.Name
                      FROM Certification_Held__c
                     WHERE Certified_Professional__r.AccountId = :acct.Id];
        }
        set;
    }
}
