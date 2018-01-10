package org.simphony.prd.Service;

import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONObject;



  
public class RequestInfoFromSqlserver {  
  
    private SqlserverUtils sqlserverUtils = null;  
    //private Integer id;
    //private String name;
    
    public List<Object> getRevenuecenter(){  
    	
    	sqlserverUtils = new SqlserverUtils();  
        Statement statement = sqlserverUtils.linkSqlserver();  
        String sql = "select -1,-999,'ALL',1\r\n" + 
        		"union all\r\n" + 
        		"SELECT DISTINCT revenueCenterMasterID,-1,( SELECT   \r\n" + 
        		"    isnull(b.NAMEMASTER,a.NAMEMASTER) as NAMEMASTER\r\n" + 
        		"    FROM REVENUE_CENTER a LEFT OUTER JOIN REVENUE_CENTER_STRING b \r\n" + 
        		"    ON a.revenuecenterid=b.revenuecenterid AND a.organizationid=b.organizationid AND a.locationid=b.locationid and b.poslanguageId = 1\r\n" + 
        		"    WHERE a.revenuecenterid = REVENUE_CENTER.revenuecenterid)  as nameMaster,2\r\n" + 
        		"    FROM revenue_center  WHERE  organizationID =  10260  AND  reportFlag = 1  AND locationID  >=  -2147483648";  
        List<Object> listRevenuecenter = new ArrayList<Object>();
        try {  
            ResultSet rs = statement.executeQuery(sql);  
            int i = 0;  
         
            while(rs.next()){  
                HashMap<Object,Object> map = new HashMap<Object,Object>();
        		map.put("id", rs.getInt(1));
        		map.put("pid", rs.getInt(2));
        		map.put("name", rs.getString(3));
        		map.put("level", rs.getInt(4));
        		
        		JSONObject jsonObject = JSONObject.fromObject(map);
        		
        		listRevenuecenter.add(jsonObject.toString());
        		System.out.println(listRevenuecenter);
                i++;  
            }  
        } catch (SQLException e) {  
            // TODO Auto-generated catch block  
            //e.printStackTrace();  
            System.err.println("SelectInfoService get出错");  
            System.err.println(e.getMessage());  
        }  
        sqlserverUtils.closeSqlserver(statement);  
        return listRevenuecenter;  
    }  
   /* public String getName(String name){  
        return "test1:"+name;  
    }  */
    
 public List<Object> getOdertype(){  
    	
    	sqlserverUtils = new SqlserverUtils();  
        Statement statement = sqlserverUtils.linkSqlserver();  
        String sql = "select  -1,-999,'ALL',1\r\n" + 
        		"union all\r\n" + 
        		"SELECT DISTINCT orderTypeReportID,-1, ( SELECT   \r\n" + 
        		"        	isnull(b.NAMEMASTER,a.NAMEMASTER) as NAMEMASTER\r\n" + 
        		"        	FROM ORDER_TYPE a LEFT OUTER JOIN ORDER_TYPE_STRING b  \r\n" + 
        		"        	ON a.ordertypeid=b.ordertypeid AND a.organizationid=b.organizationid AND a.locationid=b.locationid and b.poslanguageId = 1\r\n" + 
        		"        	WHERE a.ordertypeid = ORDER_TYPE.ordertypeid)  as nameMaster ,2 \r\n" + 
        		"        	FROM ORDER_TYPE  WHERE organizationID =  10260  \r\n" + 
        		"        	AND reportFlag = 1  AND locationID  >=  -2147483648 ";  
        List<Object> listOdertype = new ArrayList<Object>();
        try {  
            ResultSet rs = statement.executeQuery(sql);  
            int i = 0;  
         
            while(rs.next()){  
                HashMap<Object,Object> map = new HashMap<Object,Object>();
                map.put("id", rs.getInt(1));
        		map.put("pid", rs.getInt(2));
        		map.put("name", rs.getString(3));
        		map.put("level", rs.getInt(4));
        		JSONObject jsonObject = JSONObject.fromObject(map);
        		
        		listOdertype.add(jsonObject.toString());
        		//System.out.println(list);
                i++;  
            }  
        } catch (SQLException e) {  
            // TODO Auto-generated catch block  
            //e.printStackTrace();  
            System.err.println("SelectInfoService get出错");  
            System.err.println(e.getMessage());  
        }  
        sqlserverUtils.closeSqlserver(statement);  
        return listOdertype;  
    }  
      
	 public List<Object> getFamilygroup(){  
	 	
	 	sqlserverUtils = new SqlserverUtils();  
	     Statement statement = sqlserverUtils.linkSqlserver();  
	     String sql = "select -1,-999,'ALL',1\r\n" + 
	     		"union all\r\n" + 
	     		"SELECT DISTINCT familyGroupReportID,-1,  ( SELECT   \r\n" + 
	     		"	     		isnull(b.NAMEMASTER,a.NAMEMASTER) as NAMEMASTER\r\n" + 
	     		"	     		 FROM FAMILY_GROUP a LEFT OUTER JOIN FAMILY_GROUP_STRING b  \r\n" + 
	     		"	     		 ON a.familygroupid=b.familygroupid AND a.organizationid=b.organizationid AND a.locationid=b.locationid and b.poslanguageId = 1\r\n" + 
	     		"	     		WHERE a.familygroupid = FAMILY_GROUP.familygroupid)  as nameMaster,2 FROM FAMILY_GROUP WHERE organizationID =  10260\r\n" + 
	     		"	     		AND locationID  >=  -2147483648 ";  
	     List<Object> listFamilygroup = new ArrayList<Object>();
	     try {  
	         ResultSet rs = statement.executeQuery(sql);  
	         int i = 0;  
	      
	         while(rs.next()){  
	             HashMap<Object,Object> map = new HashMap<Object,Object>();
	             map.put("id", rs.getInt(1));
        		 map.put("pid", rs.getInt(2));
        		 map.put("name", rs.getString(3));
        		 map.put("level", rs.getInt(4));
	     		JSONObject jsonObject = JSONObject.fromObject(map);
	     		
	     		listFamilygroup.add(jsonObject.toString());
	     		//System.out.println(list);
	             i++;  
	         }  
	     } catch (SQLException e) {  
	         // TODO Auto-generated catch block  
	         //e.printStackTrace();  
	         System.err.println("SelectInfoService get出错");  
	         System.err.println(e.getMessage());  
	     }  
	     sqlserverUtils.closeSqlserver(statement);  
	     return listFamilygroup;  
	 } 
	 
	 public List<Object> getMajorgroup(){  
		 	
		 	sqlserverUtils = new SqlserverUtils();  
		     Statement statement = sqlserverUtils.linkSqlserver();  
		     String sql = "select -1,-999,'ALL',1\r\n" + 
		     		"union all\r\n" + 
		     		"SELECT DISTINCT majorGroupReportID,-1, ( SELECT  \r\n" + 
		     		"		     		isnull(b.NAMEMASTER,a.NAMEMASTER) as NAMEMASTER\r\n" + 
		     		"		     		 FROM MAJOR_GROUP a LEFT OUTER JOIN MAJOR_GROUP_STRING b\r\n" + 
		     		"		     		ON a.majorgroupid=b.majorgroupid AND a.organizationid=b.organizationid AND a.locationid=b.locationid and b.poslanguageId = 1\r\n" + 
		     		"		     		WHERE a.majorgroupid = MAJOR_GROUP.majorgroupid)  as nameMaster,2 FROM MAJOR_GROUP WHERE organizationID =  10260  \r\n" + 
		     		"		     		AND locationID  >=  -2147483648 ";  
		     List<Object> listMajorgroup = new ArrayList<Object>();
		     try {  
		         ResultSet rs = statement.executeQuery(sql);  
		         int i = 0;  
		      
		         while(rs.next()){  
		            HashMap<Object,Object> map = new HashMap<Object,Object>();
		             map.put("id", rs.getInt(1));
	        		 map.put("pid", rs.getInt(2));
	        		 map.put("name", rs.getString(3));
	        		 map.put("level", rs.getInt(4));
		     		JSONObject jsonObject = JSONObject.fromObject(map);
		     		
		     		listMajorgroup.add(jsonObject.toString());
		     		//System.out.println(list);
		             i++;  
		         }  
		     } catch (SQLException e) {  
		         // TODO Auto-generated catch block  
		         //e.printStackTrace();  
		         System.err.println("SelectInfoService get出错");  
		         System.err.println(e.getMessage());  
		     }  
		     sqlserverUtils.closeSqlserver(statement);  
		     return listMajorgroup;  
	 } 
	 
	 public List<Object> getTendermedia(){  
		 	
		 	sqlserverUtils = new SqlserverUtils();  
		     Statement statement = sqlserverUtils.linkSqlserver();  
		     String sql = "select -1,-999,'ALL',1\r\n" + 
		     		"union all					\r\n" + 
		     		"select distinct tenderMediaReportID,-1,(\r\n" + 
		     		"	select ISNULL(b.nameMaster,a.nameMaster) as nameMaster from TENDER_MEDIA a \r\n" + 
		     		"	left join TENDER_MEDIA_STRING b on a.organizationID=b.organizationID and a.locationID=b.locationID and a.tenderMediaID=b.tenderMediaID and b.posLanguageID=1\r\n" + 
		     		"		where a.tenderMediaID=TENDER_MEDIA.tenderMediaID) as nameMaster,2\r\n" + 
		     		"	from TENDER_MEDIA \r\n" + 
		     		"	where organizationID =  10260\r\n" + 
		     		"	AND locationID  >=  -2147483648";  
		     List<Object> listTendermedia = new ArrayList<Object>();
		     try {  
		         ResultSet rs = statement.executeQuery(sql);  
		         int i = 0;  
		      
		         while(rs.next()){ 
		            HashMap<Object,Object> map = new HashMap<Object,Object>();
		             map.put("id", rs.getInt(1));
	        		 map.put("pid", rs.getInt(2));
	        		 map.put("name", rs.getString(3));
	        		 map.put("level", rs.getInt(4));
		     		JSONObject jsonObject = JSONObject.fromObject(map);
		     		
		     		listTendermedia.add(jsonObject.toString());
		     		//System.out.println(list);
		             i++;  
		         }  
		     } catch (SQLException e) {  
		         // TODO Auto-generated catch block  
		         //e.printStackTrace();  
		         System.err.println("SelectInfoService get出错");  
		         System.err.println(e.getMessage());  
		     }  
		     sqlserverUtils.closeSqlserver(statement);  
		     return listTendermedia;  
	 } 
	 
	 public List<Object> getDiscount(){  
	    	
	    	sqlserverUtils = new SqlserverUtils();  
	        Statement statement = sqlserverUtils.linkSqlserver();  
	        String sql = "select -1,-999,'ALL',1\r\n" + 
	        		"union all\r\n" + 
	        		"select discountID,-1,nameMaster,2 from discount\r\n" + 
	        		"where organizationID =  10260\r\n" + 
	        		"AND locationID  >=  -2147483648 ";  
	        List<Object> listDiscount = new ArrayList<Object>();
	        try {  
	            ResultSet rs = statement.executeQuery(sql);  
	            int i = 0;  
	         
	            while(rs.next()){  
	                HashMap<Object,Object> map = new HashMap<Object,Object>();
	        		map.put("id", rs.getInt(1));
	        		map.put("pid", rs.getInt(2));
	        		map.put("name", rs.getString(3));
	        		map.put("level", rs.getInt(4));
	        		
	        		JSONObject jsonObject = JSONObject.fromObject(map);
	        		
	        		listDiscount.add(jsonObject.toString());
	        		System.out.println(listDiscount);
	                i++;  
	            }  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            //e.printStackTrace();  
	            System.err.println("SelectInfoService get出错");  
	            System.err.println(e.getMessage());  
	        }  
	        sqlserverUtils.closeSqlserver(statement);  
	        return listDiscount;  
	    }  
	 
	    public List<Object> getEmployee(){  
	    	
	    	sqlserverUtils = new SqlserverUtils();  
	        Statement statement = sqlserverUtils.linkSqlserver();  
	        String sql = "select -1,-999,'ALL',1\r\n" + 
	        		"union all\r\n" + 
	        		"SELECT employeeID,-1,firstName,2 \r\n" + 
	        		"FROM EMPLOYEE\r\n" + 
	        		"where organizationID =  10260\r\n" + 
	        		"AND locationID  >=  -2147483648";  
	        List<Object> listEmployee = new ArrayList<Object>();
	        try {  
	            ResultSet rs = statement.executeQuery(sql);  
	            int i = 0;  
	         
	            while(rs.next()){  
	                HashMap<Object,Object> map = new HashMap<Object,Object>();
	        		map.put("id", rs.getInt(1));
	        		map.put("pid", rs.getInt(2));
	        		map.put("name", rs.getString(3));
	        		map.put("level", rs.getInt(4));
	        		
	        		JSONObject jsonObject = JSONObject.fromObject(map);
	        		
	        		listEmployee.add(jsonObject.toString());
	        		System.out.println(listEmployee);
	                i++;  
	            }  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            //e.printStackTrace();  
	            System.err.println("SelectInfoService get出错");  
	            System.err.println(e.getMessage());  
	        }  
	        sqlserverUtils.closeSqlserver(statement);  
	        return listEmployee;  
	    } 
}  