public with sharing class DisplayContacts_CC {

    public String searchText {
        get {
            return searchText;
        }
        set {
            searchtext = value;
        }
    }

    // Indicates whether records were found
    public Boolean matches {
        get {
            return ( (contacts != null) && (contacts.size() != 0) );
        }
        set;
    }

    public Boolean searched {get; set;}                             // Indicates whether search has been done
    public ApexPages.StandardSetController setCon { get; set; }     // Standard Set Controller

    // Constructor
    public DisplayContacts_CC() {
        searched=false;
    }

    // List of Contacts displayed on the page
    public List<Contact> contacts {
        get {
            if (setCon != null ) {
                return (List<Contact>)setCon.getRecords();
            } else {
                return null;
            }
        }
        set;
    }

    // Action method initiated by user
    public void Search() {

        if (String.isNotBlank(searchText) && searchtext.length() > 1) {
            searchText = searchText + '*';

            List<sObject> contacts = [FIND :searchText
                                      IN ALL FIELDS
                                      RETURNING Contact (Id, Name, Email, Phone, Account.Name)][0];

            setCon = new ApexPages.StandardSetController(contacts);
            setCon.setPageNumber(1);
            setCon.setPageSize(10);

            searched = true;
        } else {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,
                                                      'Please enter search text at least two characters long'));
        }
    }
}
