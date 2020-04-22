trigger CourseDeliveryTrigger on Course_Delivery__c (before insert, before update) {
    
	CourseDeliveryTriggerHandler.preventInvalidCourseDeliveries(Trigger.new, Trigger.oldMap);

}