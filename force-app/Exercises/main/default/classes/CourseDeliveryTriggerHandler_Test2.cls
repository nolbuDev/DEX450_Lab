@isTest
private class CourseDeliveryTriggerHandler_Test2 {

    @testSetup
    private static void testSetupObjectDataFactory() {
        Course__c testCourse = new Course__c(Name = 'Test Course 1', Status__c = 'Active');
        insert testCourse;
        System.debug([SELECT Id, Name from Course__c]);

        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        User u = [SELECT Id FROM User WHERE profileId = :p.Id LIMIT 1];
        System.runAs(u){
            Test.loadData(Holiday.sObjectType, 'Test_Holidays');
            System.debug([SELECT Id, ActivityDate, Name FROM Holiday]);
        }
    }

    @isTest
	private static void insertCourseDeliverySuccess() {

        List<Course__c> activeCourses = [SELECT Id FROM Course__c LIMIT 1];
        Course__c course = activeCourses[0];

        Course_Delivery__c courseDelivery = new Course_Delivery__c();
        courseDelivery.Course__c = course.Id;
        courseDelivery.Start_Date__c = Date.newInstance(Date.today().year(), 9, 1);
        Test.startTest();
        Database.SaveResult insertionResult = Database.insert(courseDelivery, false);
        Test.stopTest();

        Integer errorCount = 0;
        if(!insertionResult.isSuccess()) {
            if (insertionResult.getErrors()[0].getMessage() == 'Course Delivery cannot be scheduled because it starts on a holiday.') {
                System.debug('Received expected error message');
            }
            ++errorCount;
        }
        System.assertEquals(0, errorCount);
    }
}
