public class CaseCreation_ltg {
    public List<Account> lstAcc{get;set;}

    public CaseCreation_ltg(ApexPages.StandardSetController controller) {
        getAccountList();
    }
    
    

    public static String accountName{get;set;}
    public static String accountId{get;set;}
    public Account objAcc{get;set;}
   
    public  void getAccDeatils() {
        String recordId = '0012800000vhWOgAAM';
        Account acc = [Select id,name from Account where id =: recordId];
        objAcc = acc;
        accountName = acc.Name;
        accountId = acc.Id;
        Case objCase = new Case();
        objCase.Agency__c = acc.Id;
        //return objCase;
    }
    public string getAccName() {
        if (objAcc == null) {return '';} else {return objAcc.name;}
    }
    
    public string getAccId() {
        if (objAcc == null) {return '';} else {return objAcc.id;}
    }
    
    @AuraEnabled //annotation
    public Static Case getAccDeatilsLtg(String recordId) {
         recordId = '0012800000vhWOgAAM';
        Account acc = [Select id,name from Account where id =: recordId];
        
        Case objCase = new Case();
        objCase.Agency__c = acc.Id;
        objCase.EngineeringReqNumber__c = 'Test';
        return objCase;
    }
    
    public void getAccountList() {
        lstAcc = [Select id,name from Account LIMIT 10];
    }
   
}