package Clases;

import java.util.ArrayList;
import org.jpl7.Query;

public class PrologFamilia {
        public String OpenProlog()
    {
        String msj=null;
       try 
       {
           String open="consult('ArbolFamiliar.pl')";
            //conexion BD
            Query BC = new Query(open);
            msj="Consultando BC=ArbolFamiliar:"+(BC.hasSolution()? "correcto":"incorrecto");
            
       } catch (Exception e){
           msj="Ocurrio problema en la conexion BC";}
           return msj;
       }
    
     public  String consultProlog()
     {
          ArrayList o = new ArrayList();  //Objeto array
     try{
       // String consulta= "esPadre(Y,X)"; //consulta
           
        Query g4 = new Query("esPadre(Y,X)"); //ejecuta la consulta
       
        while ( g4.hasMoreSolutions() ){
            o.add(g4.nextSolution()+"\n");   
        }
        } catch (Exception e) {
        
            System.out.println("error"+e);
        }
        return o.toString();

    }
     
          public  String consultPrologAntecesor()
     {
          ArrayList o = new ArrayList();  //Objeto array
     try{
       // String consulta= "esPadre(Y,X)"; //consulta
           
        Query g4 = new Query("antecesores(Y,X)"); //ejecuta la consulta
       
        while ( g4.hasMoreSolutions() ){
            o.add(g4.nextSolution()+"\n");   
        }
        } catch (Exception e) {
        
            System.out.println("error"+e);
        }
        return o.toString();

    }
    
}
