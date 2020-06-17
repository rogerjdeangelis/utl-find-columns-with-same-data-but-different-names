Find columns with same data but different names                                                                        
                                                                                                                       
github                                                                                                                 
https://tinyurl.com/ycp9vh2w                                                                                           
https://github.com/rogerjdeangelis/utl-find-columns-with-same-data-but-different-names                                 
                                                                                                                       
This is a module in my github                                                                                          
https://github.com/rogerjdeangelis/voodoo                                                                              
                                                                                                                       
SAS  Forum                                                                                                             
https://tinyurl.com/ycjhs6vf                                                                                           
https://communities.sas.com/t5/SAS-Programming/Finding-the-same-values-in-many-datasets/m-p/661864                     
                                                                                                                       
*_                   _                                                                                                 
(_)_ __  _ __  _   _| |_                                                                                               
| | '_ \| '_ \| | | | __|                                                                                              
| | | | | |_) | |_| | |_                                                                                               
|_|_| |_| .__/ \__,_|\__|                                                                                              
        |_|                                                                                                            
;                                                                                                                      
                                                                                                                       
Three tables with columns with different names but same data                                                           
                                                                                                                       
data  have1                                                                                                            
      have2(rename=(name=namefirst sex=sexgender age=ageyears))                                                        
      have3(rename=(name=nam1st    sex=sexgndr   age=age1st))                                                          
     ;                                                                                                                 
  set sashelp.class(obs=5 keep=name sex age);                                                                          
run;quit;                                                                                                              
                                                                                                                       
Up to 40 obs from HAVE1 total obs=5                                                                                    
                                                                                                                       
Obs     NAME           SEX      AGE                                                                                    
                                                                                                                       
 1     Joyce            F        11                                                                                    
 2     Louise           F        12                                                                                    
 3     Alice            F        13                                                                                    
 4     James            M        12                                                                                    
 5     Thomas           M        11                                                                                    
                                                                                                                       
Up to 40 obs from HAVE2 total obs=5                                                                                    
                                                                                                                       
Obs    NAMEFIRST    SEXGENDER AGEYEARS                                                                                 
                                                                                                                       
 1      Joyce           F        11                                                                                    
 2      Louise          F        12                                                                                    
 3      Alice           F        13                                                                                    
 4      James           M        12                                                                                    
 5      Thomas          M        11                                                                                    
                                                                                                                       
 Up to 40 obs from HAVE3 total obs=5                                                                                   
                                                                                                                       
Obs    NAM1ST       SEXGNDR    AGE1ST                                                                                  
                                                                                                                       
 1     Joyce           F         11                                                                                    
 2     Louise          F         12                                                                                    
 3     Alice           F         13                                                                                    
 4     James           M         12                                                                                    
 5     Thomas          M         11                                                                                    
                                                                                                                       
*            _               _                                                                                         
  ___  _   _| |_ _ __  _   _| |_                                                                                       
 / _ \| | | | __| '_ \| | | | __|                                                                                      
| (_) | |_| | |_| |_) | |_| | |_                                                                                       
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                      
                |_|                                                                                                    
;                                                                                                                      
                                                                                                                       
 These Char variables have equal values for all observations                                                           
                                                                                                                       
  Variable   Type  Len   Compare    Len                                                                                
                                                                                                                       
  NAME       CHAR    8   NAMEFIRST    8                                                                                
  NAME       CHAR    8   NAM1ST       8                                                                                
  NAMEFIRST  CHAR    8   NAM1ST       8                                                                                
                                                                                                                       
  SEX        CHAR    1   SEXGENDER    1                                                                                
  SEX        CHAR    1   SEXGNDR      1                                                                                
  SEXGENDER  CHAR    1   SEXGNDR      1                                                                                
                                                                                                                       
                                                                                                                       
These numeric variables have equal values for all observations                                                         
                                                                                                                       
                 BATCH                                                                                                 
                                                                                                                       
  Variables with All Equal Values                                                                                      
                                                                                                                       
  Variable  Type  Len   Co mpare   Len                                                                                 
                                                                                                                       
  AGE       NUM     8   AGEYEARS    8                                                                                  
  AGE       NUM     8   AGE1ST      8                                                                                  
  AGEYEARS  NUM     8   AGE1ST      8                                                                                  
                                                                                                                       
*                                                                                                                      
 _ __  _ __ ___   ___ ___  ___ ___                                                                                     
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                    
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                    
| .__/|_|  \___/ \___\___||___/___/                                                                                    
|_|                                                                                                                    
;                                                                                                                      
                                                                                                                       
data have;                                                                                                             
   merge have:;                                                                                                        
run;quit;                                                                                                              
                                                                                                                       
%_vdo_dupcol(                                                                                                          
       lib=work                                                                                                        
      ,mem=have                                                                                                        
      ,typ=Char                                                                                                        
      );                                                                                                               
                                                                                                                       
%_vdo_dupcol(                                                                                                          
       lib=work                                                                                                        
      ,mem=have                                                                                                        
      ,typ=num                                                                                                         
      );                                                                                                               
                                                                                                                       
*                                                                                                                      
 _ __ ___   __ _  ___ _ __ ___                                                                                         
| '_ ` _ \ / _` |/ __| '__/ _ \                                                                                        
| | | | | | (_| | (__| | | (_) |                                                                                       
|_| |_| |_|\__,_|\___|_|  \___/                                                                                        
                                                                                                                       
;                                                                                                                      
                                                                                                                       
%macro _vdo_dupcol(                                                                                                    
       lib=&libname                                                                                                    
      ,mem=&data                                                                                                       
      ,typ=Char                                                                                                        
      );                                                                                                               
                                                                                                                       
     /* %let typ=num;  */                                                                                              
      options nonotes;                                                                                                 
     proc sql;                                                                                                         
        create                                                                                                         
          view _vvcolumn as                                                                                            
        select                                                                                                         
          *                                                                                                            
        from                                                                                                           
          sashelp.vcolumn                                                                                              
        where                                                                                                          
              libname= %upcase( "&lib" )                                                                               
          and memname eq %upcase ( "&mem" )                                                                            
     ;quit;                                                                                                            
      data _vvren;                                                                                                     
         retain _vvvls;                                                                                                
         length _vvvls $32560;                                                                                         
         set _vvcolumn (where=( upcase(type)=%upcase("&typ") and                                                       
           libname=%upcase("&lib") and memname = %upcase("&mem"))) end=dne;                                            
           _vvvls=catx(' ',_vvvls,quote(strip(name)));                                                                 
         if dne then call symputx('_vvvls',_vvvls);                                                                    
      run;quit;                                                                                                        
      option notes;                                                                                                    
                                                                                                                       
      %put &_vvvls;                                                                                                    
      %let _vvdim=%sysfunc(countw(&_vvvls));                                                                           
      %*put &=_vvdim;                                                                                                  
                                                                                                                       
      data _null_;;                                                                                                    
       length var wth $32560;                                                                                          
       array nam[&_vvdim]  $32 (&_vvvls);                                                                              
       do i=1 to (dim(nam)-1);                                                                                         
         do j=i+1 to dim(nam);                                                                                         
          var=catx(' ',var,nam[i]);                                                                                    
          wth=catx(' ',wth,nam[j]);                                                                                    
        end;                                                                                                           
       end;                                                                                                            
       call symputx('_vvtop',var);                                                                                     
       call symputx('_vvbot',wth);                                                                                     
      run;                                                                                                             
                                                                                                                       
      %put &_vvtop;                                                                                                    
      %put &_vvbot;                                                                                                    
                                                                                                                       
      ods listing close;                                                                                               
      ods output comparesummary=_vvcmpsum;                                                                             
      proc compare data=%str(&lib).%str(&mem) compare=%str(&lib).%str(&mem) listequalvar novalues;                     
         var &_vvtop;                                                                                                  
         with &_vvbot;                                                                                                 
      run;quit;                                                                                                        
      ods listing;                                                                                                     
                                                                                                                       
      data _vveql(keep=batch);                                                                                         
        retain flg 0;                                                                                                  
        set _vvcmpsum;                                                                                                 
        if index(batch,'Variables with All Equal Values')>0 then flg=1;                                                
        if index(batch,'Variables with Unequal Values'  )>0 then flg=0;                                                
        if flg=1;                                                                                                      
      run;quit;                                                                                                        
                                                                                                                       
      proc sql noprint;select count(*) into :_vvcntstar from _vveql;quit;                                              
      title;footnote;                                                                                                  
      %put &=_vvcntstar;                                                                                               
                                                                                                                       
      %if &_vvcntstar ^= 0 %then %do;                                                                                  
         proc print data=_vveql;                                                                                       
         title1 ' ';title2 ' ';title3 ' ' ;                                                                            
         title4 "These &typ variables have equal values for all observations";                                         
         run;quit;                                                                                                     
      %end;                                                                                                            
      %else %do;                                                                                                       
         data _null_;                                                                                                  
           file print;                                                                                                 
           put //;                                                                                                     
           put "Comparison of Numeric variables to see if a variable is duplicated exactly";                           
           put //;                                                                                                     
           put "*** NO equal &typ Variables with All Equal Values found ***";                                          
           put ' ' //;                                                                                                 
         run;                                                                                                          
      %end;                                                                                                            
                                                                                                                       
%mend _vdo_dupcol;                                                                                                     
                                                                                                                       
%_vdo_dupcol(                                                                                                          
       lib=work                                                                                                        
      ,mem=have                                                                                                        
      ,typ=Char                                                                                                        
      );                                                                                                               
                                                                                                                       
%_vdo_dupcol(                                                                                                          
       lib=work                                                                                                        
      ,mem=have                                                                                                        
      ,typ=num                                                                                                         
      );                                                                                                               
                                                                                                                       
                                                                                                                       
                                                                                                                       
