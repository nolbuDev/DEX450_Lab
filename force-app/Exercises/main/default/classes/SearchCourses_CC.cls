public with sharing class SearchCourses_CC {

    /**
    *  This controller is used by both the SearchCoursesPage and ListCourseDeliveriesPage
    *  VF pages. Users will select courses using the checkboxes and then click
    *  to see the upcoming course deliveries for those courses.
    */

   // Represents the main course list
   public List<CourseWrapper> courseList {
       get {
           if (courseList == null) {
               courseList = new List<CourseWrapper>();
               for (Course__c course : [SELECT Name, Certification__r.Name, Duration__c, Status__c
                                          FROM Course__c]) {
                   courseList.add(new CourseWrapper(course));
               }
           }
           return courseList;
       }
       set;
   }

   // Contains only the course selected
   public Map<Id, CourseWrapper> selectedCourses {
       get {
           if (selectedCourses == null) {
               selectedCourses = new Map<Id, CourseWrapper>();
           }
           return selectedCourses;
       }
       set;
   }

   // Action that is triggered from the "See Upcoming Course Deliveries" button
   public PageReference listDeliveries() {

       // First clear out any previously selected courses
       selectedCourses.clear();

       // Add the newly selected courses to the map
       for (CourseWrapper cw : courseList) {
           if (cw.checked) {
               selectedCourses.put(cw.course.Id, cw);
           }
       }

       if (selectedCourses.size() > 0) {
           return Page.ListCourseDeliveriesPage;
       } else {
           ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Please select at least one Course'));
           return null;
       }

   }

   // List of all course Deliveries
   public List<Course_Delivery__c> deliveries {
       get {
           if (deliveries == null) {
               deliveries = new List<Course_Delivery__c>([
                                    SELECT Name, Course__r.Name, Instructor__r.Name, Location__c, Start_Date__c, Status__c
                                      FROM Course_Delivery__c
                                     WHERE Course__c IN :selectedCourses.keySet()
                                       AND Status__c != 'Cancelled' and Start_Date__c >= TODAY
                                  ORDER BY Start_Date__c]);
           }
           return deliveries;
       }
       set;
   }

   // Action that is fired from the ListCourseDeliveriesPage page to return to do a "New Search"
   public PageReference newSearch() {
       PageReference newPage = Page.SearchCoursesPage;
       newPage.setRedirect(true);
       return newPage;
   }

   // Wrapper class
   public class CourseWrapper {
       public Course__c course {get; set;}
       public Boolean checked {get; set;}

       public CourseWrapper(Course__c c) {
           course = c;
           checked = false;
       }
   }

}
