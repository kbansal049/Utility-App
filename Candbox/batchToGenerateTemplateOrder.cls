global class batchToGenerateTemplateOrder implements Database.Batchable<sObject>,   Database.AllowsCallouts {
 
  String query;
  String quoteId='';
  global batchToGenerateTemplateOrder(String qId) {
   quoteId= qId;
   query= 'select id from Apttus_Proposal__Proposal__c  where id =\''+quoteId+'\'';
  }

  global Database.QueryLocator start(Database.BatchableContext BC) {
    
    
    return Database.getQueryLocator(query);
  }

  global void execute(Database.BatchableContext BC, 
                     list<Apttus_Proposal__Proposal__c> batch) {
   for(Apttus_Proposal__Proposal__c od : batch)
    lightningCartController.GenerateOrderTemplate(od.Id);
  }

  global void finish(Database.BatchableContext BC) {
     
    
  }
}
