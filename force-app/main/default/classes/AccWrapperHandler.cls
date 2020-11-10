public class AccWrapperHandler {
    @AuraEnabled
    public static list<Contact> conlist {set;get;}

    @AuraEnabled
    public static list<Opportunity> oplist {set;get;}
    
    @AuraEnabled
    public static list<Account> acclist {set;get;}
    
    @AuraEnabled
    public static list<Mywrpr> wrlist {set;get;}
    
    @AuraEnabled
    public static list<Account> accDellist {set;get;} 
    
    @AuraEnabled
    public static list<Mywrpr> getRec(){
        
        wrlist = new list<Mywrpr>();
        
        acclist = new list<Account>();
        
        acclist = [select Id,Name,Industry from Account];
        
        Mywrpr m;
        
        for(Account a : acclist){
            
           m = new Mywrpr(false,a); 
            
           wrlist.add(m); 
            
        }
                  
        return wrlist;
        
    }
    
    
    @AuraEnabled
    public static list<Id> doDelete(list<Id> acId){
         
        accDellist = new list<Account>();
        
       accDellist = [select Id from Account where Id IN:acId];
        system.debug('List: '+ accDellist);
        
      
        delete accDellist;
        
        return acId;
    }
    
    
    
    
    public class Mywrpr{
        
        @AuraEnabled      
        public Boolean flag;
        
        
        @AuraEnabled
        public Account acc;
        
        
        public Mywrpr(Boolean check,Account ac){
            
            this.flag = check;
            
            this.acc = ac;
        }
        
        
    }

}