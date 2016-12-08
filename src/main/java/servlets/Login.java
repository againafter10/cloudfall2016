package servlets;

/*import com.sun.tools.internal.ws.wsdl.document.jaxws.Exception;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;

import java.io.BufferedReader;
import java.io.InputStreamReader;*/

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Created by sindhya on 12/5/16.
 */
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public Login() {
        super();

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("do get");
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //String qdone = "user";
        String email = request.getParameter("userid");
        String password = request.getParameter("pswrd");
        System.out.println(email +" "+password);
        HttpSession session = request.getSession(true);
        StringBuffer result=null;

        /*try {
            HttpClient client = HttpClientBuilder.create().build();
            HttpGet req = new HttpGet("http://localhost:8181/users");
            HttpResponse resp = client.execute(req);
            System.out.println(resp);
            BufferedReader br = new BufferedReader(new InputStreamReader(resp.getEntity().getContent()));
            result = new StringBuffer();
            String line = "";
            while ((line = br.readLine()) != null) {
                result.append(line);
            }
        }catch(IOException e){
            e.printStackTrace();
        }*/


        if(email.equals("archana@gmail.com")){
            session.setAttribute("userSession", session);
            session.setAttribute("email",email);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("user-sensors.jsp");
            if (dispatcher != null) dispatcher.forward(request, response);
        }
        else if(email.equals("nisha@gmail.com")){
            session.setAttribute("userSession", session);
            session.setAttribute("email",email);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("vendor-sensors.jsp");
            if (dispatcher != null) dispatcher.forward(request, response);
        }else if(email.equals("admin@sjsu.edu")){
            session.setAttribute("userSession", session);
            session.setAttribute("email",email);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("admin-vendor.jsp");
            if (dispatcher != null) dispatcher.forward(request, response);
        }else{
            session.setAttribute("userSession", session);
            session.setAttribute("email",email);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("admin-vendor.jsp");
            if (dispatcher != null) dispatcher.forward(request, response);

        }

        System.out.println("Database Connected");
    }

}
