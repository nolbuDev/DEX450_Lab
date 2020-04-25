public with sharing class TechnicianStatus_CX {

    private final Contact contact;
    private ApexPages.StandardController sController;

    // Constructor used to get the Account record
    public TechnicianStatus_CX(ApexPages.StandardController stdController) {
        sController = stdController;
        this.contact = (Contact)stdController.getRecord();
    }

    public PageReference editContact2() {
        return sController.edit();
    }

    public PageReference editContact3() {
        String retUrl = '/apex/TechnicianStatusPage?id=' + contact.Id;
        return new PageReference('/' + contact.Id + '/e' + '?retURL=' + retUrl);
    }

    // List of Course Attendees associated with the Course Delivery Date that the user hovers over
    public String getAttendeeList() {
        String cdId = ApexPages.currentPage().getParameters().get('courseDeliveryId');
        return buildAttendeeList(cdId);
    }

    public String buildAttendeeList(String cdId) {
        String retString;
        if (!String.isBlank(cdId)) {
            Integer count = 0;
            List<Course_Attendee__c> courseAttendees = new List<Course_Attendee__c>([
                                          SELECT Student__r.Name
                                            FROM Course_Attendee__c
                                           WHERE Course_Delivery__c = :cdId]);
            for (Course_Attendee__c ca : courseAttendees) {
                if (count == 0) {
                    retString = 'Attendees: ';
                    count++;
                }
                if (ca.Student__r.Name != null) {
                    if (count < courseAttendees.size()) {
                        retString = retString + ca.Student__r.Name + ', ';
                    } else {
                        retString = retString + ca.Student__r.Name;
                    }
                    count++;
                }
            }
        }
        return retString;
    }
}
