package org.simphony.prd.Service;

import java.io.Serializable;
import java.util.List;

import org.pentaho.platform.web.http.api.resources.Setting;  
  
public class SelectInfoService implements Serializable{  
  
    private static final long serialVersionUID = 677484458789332877L;  
    private RequestInfoFromSqlserver requestInfo = new RequestInfoFromSqlserver();  
   
    public List<Object> getRevenuecenterColoumName(){  
          
        return requestInfo.getRevenuecenter();  
    }  
 
    public List<Object> getOrdertypeColoumName(){ 
    	        
        return requestInfo.getOdertype();  
    }  
      
    public List<Object> getFamilygroupColoumName(){  
        
        return requestInfo.getFamilygroup();  
    } 
    
    public List<Object> getMajorgroupColoumName(){  
        
        return requestInfo.getMajorgroup();  
    }
    
    public List<Object> getTendermediaColoumName(){  
        
        return requestInfo.getTendermedia();  
    } 
    
    public List<Object> getDiscountColoumName(){  
        
        return requestInfo.getDiscount();  
    }
    
    public List<Object> getEmployeeColoumName(){  
        
        return requestInfo.getEmployee();  
    } 
    
}