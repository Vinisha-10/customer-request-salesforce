@IsTest
private class CustomerRequestServiceTest {

    @IsTest
    static void testGetSubmittedRequests() {

        List<Customer_Request__c> requests = new List<Customer_Request__c>();

        for (Integer i = 0; i < 3; i++) {
            requests.add(new Customer_Request__c(
                Customer_Name__c = 'Test Customer ' + i,
                Email__c = 'test' + i + '@example.com',
                Status__c = 'Submitted'
            ));
        }

        insert requests;

        Test.startTest();

        List<Customer_Request__c> result =
            CustomerRequestService.getSubmittedRequests();

        Test.stopTest();

        System.assertEquals(3, result.size());
        System.assertEquals('Submitted', result[0].Status__c);
    }


    @IsTest
    static void testPriorityDefault() {

        Customer_Request__c request = new Customer_Request__c(
            Customer_Name__c = 'Trigger Test',
            Email__c = 'trigger@example.com',
            Status__c = 'New'
        );

        insert request;

        System.assertEquals('Medium', request.Priority__c);
    }


    @IsTest
    static void testPriorityNotOverwritten() {

        Customer_Request__c request = new Customer_Request__c(
            Customer_Name__c = 'High Priority Test',
            Email__c = 'high@example.com',
            Status__c = 'New',
            Priority__c = 'High'
        );

        insert request;

        System.assertEquals('High', request.Priority__c);
    }
}