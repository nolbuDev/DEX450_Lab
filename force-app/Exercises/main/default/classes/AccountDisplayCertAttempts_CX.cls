public with sharing class AccountDisplayCertAttempts_CX {

    private final Account acct;

    public AccountDisplayCertAttempts_CX(ApexPages.StandardController stdController) {
        this.acct = (Account) stdController.getRecord();
    }

    public List<Certification_Attempt__c> results {
        get {
            if (results == null) {
                results = new List<Certification_Attempt__c>([
                    SELECT Name, Certification_Candidate__r.Name, Certification_Element__r.Name
                      FROM Certification_Attempt__c
                     WHERE Certification_Candidate__r.AccountId = :acct.Id
                       AND Status__c NOT IN ('Complete/Pass', 'Complete/Fail')
                ]);
            }
            return results;
        }
        private set;
    }

}
