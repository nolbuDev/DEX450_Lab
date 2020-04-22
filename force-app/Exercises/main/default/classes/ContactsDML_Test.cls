@isTest
private class ContactsDML_Test {
    //This method verifies that the standaloneDML method inserts two contacts into the database.
	@isTest
	private static void standaloneDMLTest(){

        System.assertEquals(0, [SELECT LastName FROM Contact].size());
        ContactsDML.standaloneDML();
        List<Contact> contactsPostInsert = [SELECT LastName FROM Contact];
        System.assertEquals(2, contactsPostInsert.size());
        
        Set<String> lastNameSet = new Set<String>();
        for(Contact contact : contactsPostInsert){
            lastNameSet.add(contact.LastName);
        }
        System.assert(lastNameSet.contains('Minkowitz'));
        System.assert(lastNameSet.contains('Singh'));
    }

    //This method verifies that the databaseMethodDML method fails to insert two 
    //contacts into the database, because one contact does not include the LastName 
    //field and the DML method is using the default allOrNone value of true.
	@isTest
    private static void databaseMethodDMLTest(){
        try{
            ContactsDML.databaseMethodDML();
            System.Assert(false);
        } catch(DMLException e){
            System.assert(e.getMessage().contains('Required fields are missing: [LastName]: [LastName]'));
        } 
    }

    @isTest
	private static void databaseMethodDMLAllOrNoneTest(){
        System.assertEquals(0, [SELECT LastName FROM Contact].size());
        
        ContactsDML.databaseMethodDMLAllOrNone();
        List<Contact> contactsPostInsert = [SELECT LastName FROM Contact];
        System.assertEquals(1, contactsPostInsert.size());
        
        System.assertEquals('Picasso', contactsPostInsert[0].LastName);
    }

    public static testMethod void exceptionsDMLTest(){
        ContactsDML.exceptionsDML();
    }    
}
