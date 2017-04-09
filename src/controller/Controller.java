package controller;



import java.io.IOException;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        String theAction = request.getParameter("action");
        //PrintWriter out = response.getWriter();
        //out.println( this.getServletContext().getRealPath(".") );
        
        if ( theAction == null)
            theAction = "viewcat";
        
        Action action = getActionFromConfig( theAction );
        
        String view = action.perform(request, response);
         
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);    
        
    } 
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("called");
    	
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    private Action getActionFromConfig( String theAction ) 
            throws IOException {
        Properties map = new Properties();
        map.load( this.getClass().getClassLoader().getResourceAsStream( ACTION_MAPPING ));
      
        String action_class = map.getProperty(theAction.toLowerCase() );      
        Action action = null;
        try {
        	
            action = (Action) Class.forName( action_class ).newInstance();
   
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return action;
    }

    private final static String ACTION_MAPPING = "controller/ActionMapping.properties"; 

}
