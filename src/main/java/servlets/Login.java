package servlets;

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

        String qdone = "user";
        String email = request.getParameter("userid");
        String password = request.getParameter("pswrd");
        System.out.println(email +" "+password);
        HttpSession session = request.getSession(true);


        if(qdone.equals("user")){
            session.setAttribute("userSession", session);
            session.setAttribute("email",email);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("user-sensors.jsp");
            if (dispatcher != null) dispatcher.forward(request, response);
        }
        else{
            //	out.println(qdone.substring(6));
            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/SimpleMarketPlace/login.jsp");
            if (dispatcher != null) dispatcher.forward(request, response);
        }
        System.out.println("Database Connected");
    }

}
