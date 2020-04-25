public class SOQLController {

    // The User's input
    public String name { get; set; }

    public List<Certification_Held__c> queryResult { get; set; }

    public void query() {

        // trim whitespace from search term
        name = name.trim();
        String qryString =
            ' SELECT Name, Certified_Professional__r.Name, Certification__r.Name, Certification__r.Number_of_Certified_Professionals__c ' +
            ' FROM Certification_Held__c ' +
            ' WHERE Name =\'' + name + '\'';

        System.debug(qryString);

        name =  String.escapeSingleQuotes(name.trim()); 
        qryString =
        ' SELECT Name, Certified_Professional__r.Name, Certification__r.Name, Certification__r.Number_of_Certified_Professionals__c ' +
        ' FROM Certification_Held__c ' +
        ' WHERE Name =\'' + name + '\'';
        System.debug(qryString);

        // Query
        // test' OR name like '%

        queryResult = Database.query( qryString );
    }
}
