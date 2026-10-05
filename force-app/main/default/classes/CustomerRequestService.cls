public class CustomerRequestService {

    @AuraEnabled(cacheable=true)
    public static List<Customer_Request__c> getSubmittedRequests() {

        List<Customer_Request__c> requests = [
            SELECT Id, Name, Customer_Name__c, Email__c, Status__c, Priority__c
            FROM Customer_Request__c
            WHERE Status__c = 'Submitted'
            ORDER BY CreatedDate DESC
        ];

        return requests;
    }
}