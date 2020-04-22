public class CourseDeliveryTriggerHandler {

    public static Set<Date> allHolidays = new Set<Date>();

    static {
        //Fetch the current holidays.
        //For simplicity's sake, we've assumed no recurring holidays
        for (Holiday holiday : [SELECT ActivityDate FROM Holiday]) {
                allHolidays.add(holiday.ActivityDate);
        }
    }

    public static void preventInvalidCourseDeliveries(List<Course_Delivery__c> newCourseDeliveryList,
                                                      Map<ID, Course_Delivery__c> oldCourseDeliveryMap) {
        for (Course_Delivery__c courseDelivery : newCourseDeliveryList) {
			Boolean checkDate = (trigger.isInsert || 
				oldCourseDeliveryMap.get(courseDelivery.Id).Start_Date__c != courseDelivery.Start_Date__c);
			if (checkDate && courseDelivery.Start_Date__c != NULL) {
                //Prevent the invoking DML action if the Start Date is in the allHolidays set.
                if ( allHolidays.contains(courseDelivery.Start_Date__c) ) {
                    courseDelivery.Start_Date__c.addError('Course Delivery cannot be scheduled because it starts on a holiday.');
                }
            }
        }
    }
}