package serverlet;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList= new ArrayList<>();
    static {
        customerList.add(new Customer(1, "Hà Bảo Ân", "01-01-2000", "Tp.Đà Nẵng", "https://scontent.fsgn2-6.fna.fbcdn.net/v/t39.30808-6/270748499_4977966628891018_2763713164359143993_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=174925&_nc_ohc=9tFf13Ap8ogAX-pM_6n&_nc_ht=scontent.fsgn2-6.fna&oh=00_AT95B4UxZtyZ5DWE-K1py8-FIeFJY-Ny4aTYXmhfQ0I5_A&oe=630A2404"));
        customerList.add(new Customer(2, "Nguyễn Tất Thành", "24-12-2000", "Tp.Đà Nẵng", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSIeYl6yCxRZijR5324jESroDuyH0vIqlKHw&usqp=CAU"));
        customerList.add(new Customer(3, "Đặng Ngọc Huy", "01-01-1997", "Tp.Đà Nẵng", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC203aj5X-UNuLHkeO73Hr4AxssyDkNuGf3g&usqp=CAU"));
    }
        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/list.jsp");
            request.setAttribute("customerList",customerList);
            requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
