

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductDiscountServlet", value = "/discount")
public class ProductDiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount  = Double.parseDouble(request.getParameter("discount"));
        double amount = discount * price * 0.01;
        double discountPrice = price - amount;
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("discount.jsp");
        request.setAttribute("amount", amount);
        request.setAttribute("discountPrice", discountPrice);
        request.setAttribute("description",description);
        requestDispatcher.forward(request, response);

    }
}
