trigger CustomerRequestTrigger on Customer_Request__c (before insert) {

    for (Customer_Request__c request : Trigger.new) {

        if (String.isBlank(request.Priority__c)) {
            request.Priority__c = 'Medium';
        }
    }
}