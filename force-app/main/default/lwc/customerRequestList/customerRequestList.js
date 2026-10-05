import { LightningElement, wire } from 'lwc';
import getSubmittedRequests from '@salesforce/apex/CustomerRequestService.getSubmittedRequests';

export default class CustomerRequestList extends LightningElement {

    columns = [
        { label: 'Request Number', fieldName: 'Name' },
        { label: 'Customer Name', fieldName: 'Customer_Name__c' },
        { label: 'Email', fieldName: 'Email__c' },
        { label: 'Status', fieldName: 'Status__c' },
        { label: 'Priority', fieldName: 'Priority__c' }
    ];

    @wire(getSubmittedRequests)
    requests;
}