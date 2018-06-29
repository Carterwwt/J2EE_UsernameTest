package Servlet;

import Dao.Impl.UserDaoImpl;
import Dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String un = req.getParameter("name");

        System.out.println(un);

        UserDao um = new UserDaoImpl();

        int isExist = um.UsernameSame(un);

        resp.getWriter().println(isExist);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
