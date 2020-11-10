public class AccExample {
    
    public AccExample(){
        
        List<Account> acList  =  [select id,name from Account limit 10];
        
        for(Account  ac  : acList){
            
           system.debug('Account List: '+ac); 
        }
        
    }

}