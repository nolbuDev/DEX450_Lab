trigger CertificationAttemptTrigger on Certification_Attempt__c (before delete, before insert, before update,
                                                                 after delete, after insert, after update, after undelete) 
{
    if (Trigger.isBefore){
        if (Trigger.isInsert){
            CertificationAttemptTriggerHandler.validateCertificationAttempt(Trigger.new);
        }
    }
    else if (Trigger.isAfter){
        if (Trigger.IsUpdate ) {
            CertificationAttemptTriggerHandler.grantInstructorSharingAccess(Trigger.new, Trigger.oldMap, Trigger.isInsert, Trigger.isUpdate);
            CertificationAttemptTriggerHandler.createCertificationHeld(Trigger.new, Trigger.oldMap);
        }
        else if (Trigger.isInsert) {
            CertificationAttemptTriggerHandler.grantInstructorSharingAccess(Trigger.new, Trigger.oldMap, Trigger.isInsert, Trigger.isUpdate);
            CertificationAttemptTriggerHandler.createCertificationHeld(Trigger.new, Trigger.oldMap);
        }
    }
}